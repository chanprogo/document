
curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' 8.129.172.186:8545  

curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["0x1b4", true],"id":1}' 8.129.172.186:8545   


curl -H "Content-Type: application/json" -X POST --data '{"jsonrpc":"2.0","method":"eth_getBalance","params":["0xbBAf97C8ba6a0753848F921Dda04B338cBFA7990", "latest"],"id":1}' 8.210.33.80:8545  