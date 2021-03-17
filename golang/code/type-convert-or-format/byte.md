```golang
package main

import (
	"encoding/hex"
	"fmt"
	"strconv"
)

func BytesToBinaryString(bs []byte) string {
	str := "bytes{"
	hex := ""
	for i := 0; i < len(bs); i++ {
		hex = hex + " 0x" + strconv.FormatUint(uint64(bs[i]), 16) + " "
	}
	str = str + hex + "}"
	return str
}

func PrintByteArrayToHex(data []byte) {
	for i := 0; i < len(data); i++ {
		fmt.Printf("%02X ", data[i])
	}
	fmt.Println("")
}

func ByteDemo() {
	oriData := []byte("Hello")
	resultStr := BytesToBinaryString(oriData)

	encodedStr := hex.EncodeToString(oriData) // 是用字符串来表示16进制
	return
}
```