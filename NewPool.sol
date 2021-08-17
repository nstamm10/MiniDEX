pragma solidity ^0.8.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";

contract NewPool {
    IERC20 public token1;
    IERC20 public token2;
    
    constructor(address _token1, address _token2) public {
        token1 = IERC20(_token1);
        token2 = IERC20(_token2);
    }
    
    // STAKING
    // 1. client-side approves smart contract to spend his/her tokens by calling token.approve function
    // 2. client-side calls contract stake method: 
    //      - smart contract calls transferFrom, sending tokens from msg.sender to itself (done for both tokens)
    //      - smart contract keeps track of tokens that it owns and from who it recieved it from -- (not needed yet)
    
    
    // SWAPPING
    //   Swapping ether for ERC20 token -- (may not want to implement)
    //   1. client calls contract etherSwap method with ether specified in value of call.
    //      this sends ether to smart contract
    //   2. smart contract sends ERC20 token back to msg.sender using token.transferFrom
    
    //   Swapping ERC20 token for ERC20 token
    //   1. client-side approves smart contract to spend his/her tokens by calling toke.approve function
    //   2. smart contract calls transferFrom, sending tokens from msg.sender to itself
    //   3. smart contract calls transfer, sending return tokens from itself to msg.sender
    
    
    
    // allows msg.sender to stake ERC20 tokens in pool
    function stake(uint _amount1, uint _amount2) external {
        // before calling this method, client needs to approve this contract to spend tokens
        
        // trasfer token1 from msg.sender to this contract
        _safeTransferFrom(token1, msg.sender, address(this), _amount1);
        
        // transfer token2 from msg.sender to this contract 
        _safeTransferFrom(token2, msg.sender, address(this), _amount2);
    }
    
    // returns this contract's balance of a given token
    function getBalanceOfToken(IERC20 _token) public returns (uint256) {
        return _token.balanceOf(address(this));
    }
    
    // swaps one ERC20 token for an equal amount of another
    function swap(uint _amount) public {
        // before calling this method, client needs to approve this contract to spend tokens
        
        // transfer _amount of token1 from msg.sender to itself
        _safeTransferFrom(token1, msg.sender, address(this), _amount);
        
        // transfer _amount of token2 from this contract to msg.sender
        _safeTransfer(token2, msg.sender, _amount);
    }
    
    function _safeTransferFrom(IERC20 token, address sender, address recipient, uint amount) private {
        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Token transfer failed!");
    }
    
    function _safeTransfer(IERC20 token, address recipient, uint amount) private {
        bool sent = token.transfer(recipient, amount);
        require(sent, "Token transfer failed!");
    }
}