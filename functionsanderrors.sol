// pragma solidity ^0.8.0;

contract TokenExchange {
    address public admin;
    mapping(address => uint256) public userBalances;

    // Constructor to set the admin of the exchange
    constructor() {
        admin = msg.sender;
    }

    // Function to deposit tokens into the exchange
    function depositTokens(uint256 amount) external {
        // Ensure the sender is not the admin
        require(msg.sender != admin, "Admin cannot deposit tokens");

        // Increase the user's balance
        userBalances[msg.sender] += amount;
    }

    // Function to withdraw tokens from the exchange
    function withdrawTokens(uint256 amount) external {
        // Ensure the user has a sufficient balance
        require(userBalances[msg.sender] >= amount, "Insufficient balance");

        // Decrease the user's balance
        userBalances[msg.sender] -= amount;
    }

    // Function to perform a token swap
    function swapTokens(address user, uint256 amount) external {
        // Ensure the sender is the admin
        assert(msg.sender == admin);

        // Ensure the user has a sufficient balance
        require(userBalances[user] >= amount, "Insufficient balance");

        // Perform the token swap
        // (In a real scenario, there would be additional logic here)
        
        // If the swap is successful, deduct the amount from the user's balance
        userBalances[user] -= amount;
    }
}