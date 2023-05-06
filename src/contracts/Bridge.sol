pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract ERC20Bridge {
    address public tokenA;
    address public tokenB;
    mapping(address => mapping(uint256 => bool)) public processedNonces;
    
    event SwapStarted(address indexed user, uint256 indexed nonce, uint256 amount);
    event SwapCompleted(address indexed user, uint256 indexed nonce, uint256 amount);
    
    constructor(address _tokenA, address _tokenB) {
        tokenA = _tokenA;
        tokenB = _tokenB;
    }
    
    function startSwap(uint256 amount, uint256 nonce) external {
        require(amount > 0, "Amount must be greater than 0");
        require(!processedNonces[msg.sender][nonce], "Nonce already processed");
        processedNonces[msg.sender][nonce] = true;
        
        IERC20(tokenA).transferFrom(msg.sender, address(this), amount);
        emit SwapStarted(msg.sender, nonce, amount);
    }
    
    function completeSwap(address user, uint256 nonce, uint256 amount) external {
        require(amount > 0, "Amount must be greater than 0");
        require(!processedNonces[user][nonce], "Nonce already processed");
        processedNonces[user][nonce] = true;
        
        IERC20(tokenB).transfer(user, amount);
        emit SwapCompleted(user, nonce, amount);
    }
}
