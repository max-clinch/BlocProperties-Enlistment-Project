// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

import "./SafeMath.sol";

contract RentContract {
    using SafeMath for uint;

    bool public circuitBreakerStopped = false;
    address payable public owner;
    uint public contractExpirationDate;
    string public landlord;
    string public tenant;
    uint public totalRentPaid;
    Rent public rentSetup;
    RentPayment[] public payments;

    mapping(address => bool) public admins;
    mapping(string => Rent) public rentSetupMap;

    event RentPaymentMade(string tenantEmail, uint paymentDate, uint amount);

    struct Rent {
        string landlordName;
        string tenantName;
        string tenantEmail;
        RentPayment firstPayment;
        uint firstPaymentDate;
        uint rentExpirationDate;
    }

    struct RentPayment {
        string tenantEmail;
        uint paymentDate;
        uint amount;
    }

    modifier validateTenant(string memory tenantEmail) {
        require(keccak256(abi.encodePacked(tenantEmail)) == keccak256(abi.encodePacked(rentSetup.tenantEmail)), "Invalid tenant email");
        require(keccak256(abi.encodePacked(tenant)) == keccak256(abi.encodePacked(rentSetup.tenantName)), "Invalid tenant name");
        _;
    }

    modifier validateAmount(uint amount) {
        require(amount > 0, "Amount should be greater than 0");
        _;
    }

    modifier isNotDeprecated() {
        require(!rentContractExpired(), "Contract is deprecated");
        _;
    }

    modifier isDeprecated() {
        require(rentContractExpired(), "Contract is not deprecated");
        _;
    }

    modifier ownerOnly() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    modifier onlyAdmin() {
        require(admins[msg.sender], "Not an admin");
        _;
    }

    modifier stopInEmergency() {
        require(!circuitBreakerStopped, "Emergency stop is active");
        _;
    }

    modifier onlyInEmergency() {
        require(circuitBreakerStopped, "Not in emergency stop");
        _;
    }

    constructor(string memory _tenantEmail, string memory _tenantName, string memory _landlordName, uint _amount, uint _duration) {
        contractExpirationDate = block.timestamp.add(_duration);
        owner = payable(msg.sender);
        tenant = _tenantName;
        landlord = _landlordName;

        RentPayment memory firstPayment = RentPayment({
            tenantEmail: _tenantEmail,
            paymentDate: block.timestamp,
            amount: _amount
        });

        rentSetup = Rent({
            tenantEmail: _tenantEmail,
            tenantName: _tenantName,
            landlordName: _landlordName,
            firstPayment: firstPayment,
            firstPaymentDate: firstPayment.paymentDate,
            rentExpirationDate: contractExpirationDate
        });

        rentSetupMap[_tenantEmail] = rentSetup;
        payments.push(firstPayment);
        totalRentPaid = totalRentPaid.add(firstPayment.amount);
    }

    function receiveMonthlyRent(string memory _tenantEmail, uint _amount) public payable
        ownerOnly()
        isNotDeprecated()
        validateAmount(_amount)
        validateTenant(_tenantEmail)
    {
        RentPayment memory payment = RentPayment({
            tenantEmail: _tenantEmail,
            paymentDate: block.timestamp,
            amount: _amount
        });

        payments.push(payment);
        totalRentPaid = totalRentPaid.add(payment.amount);
        emit RentPaymentMade(payment.tenantEmail, payment.paymentDate, payment.amount);
    }

    function killContract() public ownerOnly() {
        owner.transfer(address(this).balance);
    }

    function rentContractExpired() public view returns (bool) {
        return block.timestamp > contractExpirationDate;
    }
}
