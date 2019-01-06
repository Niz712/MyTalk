pragma solidity ^0.5.0;

contract MyTalk {

    // 每次点赞的奖励
    uint256 public readPrice = 0.001 ether;

    // 每次发布句子的价格
    uint256 public publishPrice = 0.001 ether;

    // 合约拥有者的地址
    address owner;

    // 发布句子事件
    event PublishArticle(address sender, string title);

    // 点赞句子事件
    event ReadArticle(address sender);

    // 存放每个作者的奖励，用于提现
    mapping (address => uint) pendingWithdrawals;

    // 存放address到title的映射
    mapping (address => string) titleOf;

    // 存放title到address的映射
    mapping (string => address) authorAddress;


    // 函数装饰器--合约拥有者权限
    modifier onlyOwner() {
        require(owner == msg.sender);
        _;
    }

    // 合约构造函数
    constructor() public {
        owner = msg.sender;
    }

    // 发布句子函数
    function Publish(string memory _title) public payable {
        require(msg.value >= publishPrice);

        // 存放句子与作者地址的映射
        authorAddress[_title] = msg.sender;
        titleOf[msg.sender] = _title;

        // 触发发布句子事件
        emit PublishArticle(msg.sender, _title);
    }

    // 点赞句子函数
    function Read(string memory _title) public payable {
        require(msg.value >= readPrice);

        // 金句作者获得奖励
        address _author = authorAddress[_title];
        pendingWithdrawals[_author] += readPrice;

        // 触发句子点赞事件
        emit ReadArticle(msg.sender);
    }


    // 查看合约余额
    function contractBalance() public view returns(uint) {
        return address(this).balance;
    }


    // 提现奖励
    function withdraw() public payable {
        uint amount = pendingWithdrawals[msg.sender];
        pendingWithdrawals[msg.sender] = 0;
        msg.sender.transfer(amount);
    }

    // 查看作者累计奖励
    function balanceOf(address user) public view returns(uint) {
        return pendingWithdrawals[user];
    }

    // 设置发布金句价格
    function setPublishPrice(uint _publishPrice) public onlyOwner {
        publishPrice = _publishPrice;
    }

    // 设置点赞金句奖励
    function setReadPrice(uint _readPrice) public onlyOwner {
        readPrice = _readPrice;
    }

}