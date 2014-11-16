//
// Tests TCP/IP connection bandwidth
//
// Usage: $ go run tcp_testing.go
//

package main

import "net"
import "fmt"
import "bufio"
import "time"

const TEST_SIZE = 1000000 // test with 1MB data 
const BUF_SIZE = 2 * 1000000 // buffer size = 2MB 

func main() {

    // connect
    conn, err := net.Dial("tcp", "192.168.1.250:5000")
    if err != nil {
        fmt.Printf("%s", err)
        return
    }

    // sending random strings with a goroutine
    go func() {
        for {
            fmt.Fprintf(conn, "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789")
        }
    }()

    // receiving the strings
    var reader = bufio.NewReader(conn) 
    var total = 0
    var buf []byte = make([]byte, BUF_SIZE)
    var start_time = time.Now()
    for {
        l, err := reader.Read(buf)
        if err != nil {
            fmt.Printf("%s", err)
            return
        }
        if l == 0 || total >= TEST_SIZE {
            break
        }
        total += l
    }

    // disconnect
    conn.Close()

    // reporting
    elapsed_time := time.Now().Sub(start_time)
    fmt.Printf("processed %d bytes at %.2f Mbps\n", total * 10, float64(total * 10 * 8) / float64(elapsed_time.Seconds() * 1000000)) 
}

