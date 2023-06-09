---
id: '755'
title: Golang Worker Pattern Example
languages:
- go
tags:
---
An example of the worker pattern in Go.

Executes, e.g., 20 units of work with 20 workers, taking 2 seconds each, in 2 seconds.

```go
package main

//
// $ go build worker.go && WORKERS=20 JOBS=20 ./worker
//
import (
 "fmt"
 "os"
 "strconv"
 "sync"
 "time"
)

// A unit of work
type Rabbit struct {
 ID   int
 Name string
}

// The worker accepting a unit of work
type RabbitWork struct {
 Rabbit Rabbit
}

func main() {
 jobCount, _ := 	strconv.Atoi(os.Getenv("JOBS"))
 workerCount, _ := 	strconv.Atoi(os.Getenv("WORKERS"))
 start := time.Now()
 workers := make(chan RabbitWork, workers)
 var wg sync.WaitGroup

 // Add  workers to our startup "Icarus"
 for i := 0; i < workerCount; i++ {
  wg.Add(1)
  go func() {
   for work := range workers {
    // do some work on data
    var rabbit = work.Rabbit
    fmt.Println("Capturing", rabbit.Name, "(", rabbit.ID, ")")
    time.Sleep(2 * time.Second)
    fmt.Println("Skinned", rabbit.Name, "(", rabbit.ID, ")")
   }
   wg.Done()
  }()
 }

 // Give some work to the workers
 for i := 1; i <= jobCount; i++ {
  workers <- RabbitWork{
   Rabbit: Rabbit{Name: "Toffe", ID: i},
  }
 }

 // Wait for workers to do their job
 close(workers)
 wg.Wait()
 fmt.Println("Work took", time.Since(start).Seconds(), "seconds")
}
```
    

Notes
-----

1. WaitGroup waits for all work to finish
2. wg.Wait() blocks until wg.Done() is called 20 times
3. workers <- RabbitWork will block if all 20 workers are busy working
4. for data := range tasks iterates over incoming work sent through the tasks channel
5. close(workers) closes the channel
6. 40 units of work with 20 workers will complete in 4 seconds
7. also see: <http://marcio.io/2015/07/handling-1-million-requests-per-minute-with-golang/>
