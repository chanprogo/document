const Web3 = require('web3')

var provider = new Web3.providers.HttpProvider("http://localhost:8545")
var web3 = new Web3(provider)

async function action(count) {
    var latestBlockNumber = await web3.eth.getBlockNumber()
    console.log('latestBlockNumber=', latestBlockNumber)
    var sum = 0
    var i = latestBlockNumber - count + 1
    var currentBlock = await web3.eth.getBlock(i)
    console.log(i, currentBlock.timestamp, "--")
    i++;
    for (; i <= latestBlockNumber; i++) {
        var block = await web3.eth.getBlock(i)
        sum += block.timestamp - currentBlock.timestamp
        console.log(i, block.timestamp, block.timestamp - currentBlock.timestamp)
        currentBlock = block
    }
    // console.log('Completed! avgTime=', Math.round(sum / (count - 1)))
    console.log('Completed! avgTime=', sum / (count - 1))
}

action(700)