# MyTalk

Github源码地址：https://github.com/Niz712/MyTalk



## 选题背景、依据

根据原来的开题报告，自言一个运行在区块链上的小型微博，分布式应用的特点使它在用户发布微博后，不能由中心管理员直接删除，只有用户自己能够对自己的微博进行操作。

但是由于能力有限，最终只实现了发布与点赞的功能。



## 使用说明

### 依赖

- node
- npm
- truffle
- ganache
- MetaMask

### 运行

首先安装node_modules

```
npm install
```

启动ganache，使用的是图形化界面，直接quickstart即可，默认端口是7545

![1546792683403](images\1546792683403.png)

部署合约

```
truffle migrate
```

如果已经部署过，则使用

```
truffle migrate --reset
```

输出如下则表示部署成功

![1546792847463](images\1546792847463.png)

然后可以看到ganache里面已经挖了4个区块了

![1546792894061](images\1546792894061.png)

启动网页

```
npm run dev
```

结果如下

![1546793626583](images\1546793626583.png)

![1546793418538](images\1546793418538.png)

连接MetaMask，选择`Import using account seed phrase`，输入ganache显示的助记词，就能看到ganache给我们默认设置的账户

![1546793262474](images\1546793262474.png)

然后切换网络到`127.0.0.1:7454`

![1546793876099](images\1546793876099.png)



## 测试

发布

![1546793688446](images\1546793688446.png)

发布成功

![1546793931485](images\1546793931485.png)

点赞

![1546793952726](images\1546793952726.png)

提现

![1546794383820](images\1546794383820.png)

MetaMask账户，可以看到这三次交易

![1546794220523](images\1546794220523.png)