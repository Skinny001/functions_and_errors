# functions_and_errors
A  smart contract manages token deposits, withdrawals, and swaps. It uses require() for condition checks, assert() for invariants, and revert() implicitly in case of failures, demonstrating secure and controlled token operations.


This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The TokenExchange smart contract manages token deposits, withdrawals, and swaps. It uses require() for condition checks, assert() for invariants, and revert() implicitly in case of failures, demonstrating secure and controlled token operations.

Getting Started
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g.,function_and_error). Copy and paste the following code into the file:

pragma solidity ^0.8.0;

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





To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile TokenExchange" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "TokenExchange" contract from the dropdown menu, and then click on the "Deploy" button. 

You will see what you deploy in your terminal 


