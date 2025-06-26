//
//  PracticeAlgo.swift
//  APIServiceNCoreData
//
//  Created by hb on 25/06/25.
//

import Foundation
//
//  PracticeA.swift
//  BookXPAssign
//
//  Created by hb on 25/06/25.
//

import Foundation

// 1-

/*
@MainActor
func say(_ text: String, completion: @escaping () -> Void) {
    let delay = Double.random(in: 1...2)
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        print(text)
        completion()
    }
}

let group = DispatchGroup()

print("Hi")

group.enter()
say("I love cookies") {
    group.leave()
}

group.enter()
say("My dog is called Emma") {
    print("Task 1 Thread",Thread.current)
    group.leave()
}

group.enter()
say("I develop iOS apps") {
    group.leave()
}

group.notify(queue: .main) {
    print("Goodbye")
}
 */


// 2 -

//let dispatchGroup = DispatchGroup()
//// Serial
//let serialQueue = DispatchQueue(label: "com.example.disQue")
//
//let concurrentQueue = DispatchQueue(label: "com.example.disQue", attributes: .concurrent)
//
//// concurrent -
//// Tasks to be executed concurrently and monitored as a group
//concurrentQueue.async(group: dispatchGroup) {
//    print("Task 1: Start")
//    print("Task 1 Thread",Thread.current)
//    // Perform some work
//    print("Task 1: End")
//}
//
//concurrentQueue.async(group: dispatchGroup) {
//    print("Task 2: Start")
//    print("Task 2 Thread",Thread.current)
//    // Perform some work
//    print("Task 2: End")
//}
//
//
//// Serial -
////concurrentQueue.sync {
////    print("Task 1: Start")
////    print("Task 1 Thread",Thread.current)
////    // Perform some work
////    print("Task 1: End")
////}
////
////concurrentQueue.sync {
////    print("Task 2: Start")
////    print("Task 2 Thread",Thread.current)
////    // Perform some work
////    print("Task 2: End")
////}
//
//// Wait for all tasks in the group to finish
//dispatchGroup.wait()
//print("All tasks are done!")


// 3-

/*
// Create a serial DispatchQueue
let serialQueue = DispatchQueue(label: "com.example.serial")

// Create a concurrent DispatchQueue
let concurrentQueue = DispatchQueue(label: "com.example.concurrent", qos: .background, attributes: .concurrent)

// Perform tasks on a serial queue
// as the queue is serial, so no matter you use async it will run seaially.
serialQueue.async {
    print("Task 1 on serial queue")
}

serialQueue.async {
    print("Task 2 on serial queue")
}

serialQueue.async {
    print("Task 3 on serial queue")
}

 //Perform tasks on a concurrent queue
// In this case if you use sync instead of async, no matter the queue is concurrent it will run serially.
concurrentQueue.async {
    print("Task 1 on concurrent queue")
}

concurrentQueue.async {
    print("Task 2 on concurrent queue")
}

concurrentQueue.async {
    print("Task 3 on concurrent queue")
}

concurrentQueue.async {
    print("Task 4 on concurrent queue")
}

*/


/// Swap Two Numbers

// 1.
//var a = 10
//var b = 20

//1.  using Directly tuple

//(a, b) = (b, a)
//print("\(a), \(b)")


//2. By using Function
// Here use inout because you can not swap params directly, so you have to chnage it in address.
/**
 
 func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
     (a, b) = (b, a)
 }

 swapTwoValues(&a, &b)
 print("\(a), \(b)")

 var i = "Hello"
 var j = "world"
 swapTwoValues(&i, &j)
 print("\(i), \(j)")
 
 */



//MARK: - Swap two index in an array


/**
 var array = [10, 20 , 30]
 var names = ["Hello", "World", "guys"]

 func swapIndexInArray(array: inout [Int], _ i: Int, j: Int) {
     array.swapAt(i, j)
     print("Array : \(array)")
 }

///swapIndexInArray(array: &array, 0, j: 2)
 

 // For Generic
 func swapIndexInArrayGen<item>(array: inout [item], _ i: Int, j: Int) {
     array.swapAt(i, j)
     print("Array : \(array)")
 }
 swapIndexInArrayGen(array: &array, 0, j: 2)
 swapIndexInArrayGen(array: &names, 0, j: 2)
 */


//MARK: - Remove Duplicate elements From an array

/**
 /// 1.

 func removeDuplicateElement<T>(_ array: [T]) where T: Equatable {
     var duplicateElements: [T] = []
     array.forEach { element in
         if !duplicateElements.contains(element) {
             duplicateElements.append(element)
         }
     }
     
     print("Duplicate elements: \(duplicateElements)")
 }

 removeDuplicateElement([10, 2, 3, 4, 10, 3, 4])
 removeDuplicateElement(["Hello", "World", "Hello"])

 /// 2.
 // Return the array of duplicate elemets
 func returnDuplicateElementArray<T: Hashable>(_ array: [T]) {
     var repeatedElements: [T] = []
     var tempDict: [T: Int] = [:]
     
     array.forEach { item in
         tempDict[item, default: 0] += 1
         if tempDict[item] == 2 {
             repeatedElements.append(item)
         }
     }
     
     print("Duplicate elements: \(repeatedElements)")
     print("Dictionary: \(tempDict)")
     print("Array After removing duplicates :: \(tempDict.keys)")
 }

 returnDuplicateElementArray([1, 3, 2, 4, 5, 3, 6, 7, 4])

 */


//MARK: - Find The Second Largest Number In An Array
///

/**
 func returnSecondLargestNumber(_ array: [Int]) -> Int? {
     
     guard array.count > 1 else { return nil }
     
     var largest: Int = Int.min
     var secondLargest: Int = Int.min

     for num in array {
         if num > largest {
             secondLargest = largest
             largest = num
         } else if num > secondLargest {
             secondLargest = num
         }
     }
     
     if secondLargest == Int.min {
         print("No second largest value found")
         return nil
     }
     
     print("Second Largest in the array: \(secondLargest)")
     return secondLargest
 }

 let array: [Int] = [3, 1, 8, 2, 4, 6, 3, 2, 9]
 returnSecondLargestNumber(array)
 */



//MARK: - Find the second smallest number in an array

/**
 // [6, 4, 5, 3, 1, 2]
 func returnSecondSmallest(_ array: [Int]) -> Int? {
     
     guard array.count > 1 else { return nil }
     
     var smallest = Int.max
     var secondSmallest = Int.max
     
     for num in array {
         if num < smallest {
             secondSmallest = smallest
             smallest = num
         } else if num < secondSmallest {
             secondSmallest = num
         }
     }
     print("Second smallest in the array: \(secondSmallest)")
     return secondSmallest == Int.max ? nil : secondSmallest
     
 }

 returnSecondSmallest([6, 4, 2, 5, 3, 1])
 */


//MARK: - Prime Number -

/**
 func returnPrimeNumber(_ number: Int) -> Bool {
     guard number >= 2 else {return false}
     guard number != 2 else { return true }
     guard number % 2 != 0 else { return false }
     
 //    return !(2..<number).contains { number % $0 == 0 }
     return !stride(from: 3, to: number, by: 2).contains { number % $0 == 0 }
 }

 print(returnPrimeNumber(11))
 */

//MARK: - create a counter class where I can increase the count of a variable, in thread wise so that no other thigs can affect one


// https://augustatseattle.medium.com/swift-multi-thread-handle-cc797c904193
final class ThreadSafeCounter {
    private var counter: Int = 0
    private var queue: DispatchQueue
    
    init(counter: Int = 0, label: String = UUID().uuidString) {
        self.counter = counter
        // Each instance gets its own serial queue, so increments are isolated per counter
        self.queue = DispatchQueue(label: "Counter.queue.\(label)")
    }
    
    func increment() {
        queue.sync {
            counter += 1
        }
    }
    
    func decrement() {
        queue.sync {
            counter -= 1
        }
    }
    
    func get() -> Int {
        queue.sync {
            return counter
        }
    }
    
    // If I do not use clouse in asnc case this will give me error
    // is happening because you are trying to return a value from inside an async closure, but the async method itself (queue.async { ... }) does not return a value—it returns immediately and executes the closure later, asynchronously
    func getAsync(completion: @escaping (Int) -> Void) {
        queue.async {
            completion(self.counter)
        }
    }
}

/// Using DispatchGroup
/**
 let counter = ThreadSafeCounter()
 let group = DispatchGroup()

 group.enter()
 DispatchQueue.global().async {
     counter.increment()
     group.leave()
 }

 group.enter()
 DispatchQueue.global().async {
     counter.increment()
     group.leave()
 }

 group.notify(queue: .main) {
     print(counter.get()) // Now this will print 2
 }

 */

class Operation {
    
    init() {
//        doSomething()
        usingOperationQueue()
    }
    
    func doSomething() {
        let counter = ThreadSafeCounter()
        DispatchQueue.global().async {
            counter.increment()
        }
        DispatchQueue.global().async {
            counter.increment()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            print("Through sync \(counter.get())")
        })
        
        counter.getAsync { value in
            print("Through async \(value)")
        }
    }
    
    func usingOperationQueue() {
        let counter = AvoidDeadLockUsingOperationQueue()
        counter.increment()
        

        counter.increment()
        
        counter.get { value in
            print("Using Operation queue \(value)")
        }

    }
}

// MARK: - NOTE -
/**
 How to safely use async with a concurrent queue?
 To safely update a counter on a concurrent queue, you should use a barrier flag for writes (increments/decrements), which ensures that the write operation is exclusive and no other reads or writes happen at the same time
 
 let queue = DispatchQueue(label: "Counter.queue", attributes: .concurrent)

 func increment() {
     queue.async(flags: .barrier) {
         counter += 1
     }
 }

 func get() -> Int {
     var value = 0
     queue.sync {
         value = counter
     }
     return value
 }

 */


// MARK: - USING OPERATION QUEUE
final class AvoidDeadLockUsingOperationQueue {
    private var counter: Int = 0
    private var queue = OperationQueue()
    
    init()  {
        queue.maxConcurrentOperationCount = 1
    }
    
    func increment() {
        queue.addOperation {
            self.counter += 1
        }
    }
    
    func decrement() {
        queue.addOperation {
            self.counter -= 1
        }
    }
    
    func get(completion: @escaping (Int) -> Void) {
        queue.addOperation {
            completion(self.counter)
        }
    }
    
    
}


// MARK: - USING DispatchSemaphore
final class SemaphoreCounter {
    private var counter: Int = 0
    private let semaphore = DispatchSemaphore(value: 1) // Acts as a lock

    func increment() {
        semaphore.wait()
        counter += 1
        semaphore.signal()
    }

    func decrement() {
        semaphore.wait()
        counter -= 1
        semaphore.signal()
    }

    func get() -> Int {
        semaphore.wait()
        let value = counter
        semaphore.signal()
        return value
    }
}







// MARK: -  Serial/Coucurrent/Sync/Async

class ExecutionOne {
    var counter = 0
    
    init() {
//        foo()
        outputRealtedFuncUsingSerailQueueWithSync()
//        outputRealtedFuncUsingSerailQueueWithAsync()
//        outputRealtedFuncUsingConcurrentQueueWithSync()
//        outputRealtedFuncUsingConcurrentQueueWithAsync()
//        dispatchGroup()
    }
    
    func foo() {
        
        // In the below code if we use sync instead of async it will cause a deadlock because it will block the main thread till the execution complete as it is sync. So no other resources can access the main thread.
        
        DispatchQueue.main.async {
            for i in 0...3 {
                self.counter = i
                print("IN first Place \(self.counter)")
            }
        }
        
        // Will Execute first as the upper block is Async so it will not block the execution
        for i in 4..<6 {
            counter = i
            print("In Second Place \(counter)")
        }
        
        // It will execute at last even if it is async because default the distachqueue.main is serail queue and it will execute one task at a time in FIFO order so the first task will execute first
        DispatchQueue.main.async {
            self.counter = 9
            print("In third Place \(self.counter)")
        }
    }
    
    
    // Serial Queue With Sync
    func outputRealtedFuncUsingSerailQueueWithSync() {
        let serialQueue = DispatchQueue(label: "serial_queue")
        var counter = 0
        
        // Block the execution as it is sync
        serialQueue.sync {
            for i in 1...3 {
                counter = i
                print("In First Place \(counter)")
            }
        }
        
        for i in 4...5 {
            counter = i
            print("In Second Place \(counter)")
        }
        
        serialQueue.sync {
            for i in 6...9 {
                counter = i
                print("In Third Place \(counter)")
            }
        }
    }
    // Output -
    /**
     In First Place 1
     In First Place 2
     In First Place 3
     In Second Place 4
     In Second Place 5
     In Third Place 6
     In Third Place 7
     In Third Place 8
     In Third Place 9
     */
    
    // In the below function I am using serial queue with async block so it will not block any task but the task will run serially in FIFO order.
    func outputRealtedFuncUsingSerailQueueWithAsync() {
        let concurrentQueue = DispatchQueue(label: "serial_queue")
        var counter = 0
        
        concurrentQueue.async {
            for i in 1...3 {
                counter = i
                print("In First Place \(counter)")
            }
        }
        
        for i in 4...6 {
            counter = i
            print("In Second Place \(counter)")
        }
        
        concurrentQueue.async {
            for i in 7...9 {
                counter = i
                print("In Third Place \(counter)")
            }
        }
    }
    // Output -
    /**
     In First Place 4
     In Second Place 4
     In First Place 2
     In Second Place 5
     In First Place 3
     In Second Place 6
     In Third Place 7
     In Third Place 8
     In Third Place 9
     */
    
    // It will execute one at a time even if we use concurrent queue because of the manner of execution is sync.
    func outputRealtedFuncUsingConcurrentQueueWithSync() {
        let concurrentQueue = DispatchQueue(label: "concurrent_queue", attributes: .concurrent)
        var counter = 0
        
        concurrentQueue.sync {
            for i in 1...3 {
                counter = i
                print("In First Place \(counter)")
            }
        }
        
        for i in 4...6 {
            counter = i
            print("In Second Place \(counter)")
        }
        
        concurrentQueue.sync {
            for i in 7...9 {
                counter = i
                print("In Third Place \(counter)")
            }
        }
    }
    // - Output
    /**
     In First Place 1
     In First Place 2
     In First Place 3
     In Second Place 4
     In Second Place 5
     In Second Place 6
     In Third Place 7
     In Third Place 8
     In Third Place 9
     */
    
    func outputRealtedFuncUsingConcurrentQueueWithAsync() {
        let concurrentQueue = DispatchQueue(label: "concurrent_queue", attributes: .concurrent)
        var counter = 0
        
        concurrentQueue.async {
            for i in 1...3 {
                counter = i
                print("In First Place \(counter)")
            }
        }
        
        for i in 4...6 {
            counter = i
            print("In Second Place \(counter)")
        }
        
        concurrentQueue.async {
            for i in 7...9 {
                counter = i
                print("In Third Place \(counter)")
            }
        }
    }
    // Output -
    /**
     In Second Place 4
     In First Place 4
     In First Place 2
     In Second Place 5
     In First Place 3
     In Second Place 6
     In Third Place 7
     In Third Place 8
     In Third Place 9
     */
    
    // DispatchGroup alternate - DispatchSemaphoe, OperationQueue
    func dispatchGroup() {
        let dispatchGroup = DispatchGroup()
        // Serial
        let serialQueue = DispatchQueue(label: "com.example.disQue")
        
        let concurrentQueue = DispatchQueue(label: "com.example.disQue", attributes: .concurrent)
        
        // concurrent -
        // Tasks to be executed concurrently and monitored as a group
//        concurrentQueue.async(group: dispatchGroup) {
//            print("Task 1: Start")
//            print("Task 1 Thread",Thread.current)
//            // Perform some work
//            print("Task 1: End")
//        }
//        
//        concurrentQueue.async(group: dispatchGroup) {
//            print("Task 2: Start")
//            print("Task 2 Thread",Thread.current)
//            // Perform some work
//            print("Task 2: End")
//        }
        
        
        // Serial -
        concurrentQueue.sync {
            print("Task 1: Start")
            print("Task 1 Thread",Thread.current)
            // Perform some work
            print("Task 1: End")
        }
        
        concurrentQueue.sync {
            print("Task 2: Start")
            print("Task 2 Thread",Thread.current)
            // Perform some work
            print("Task 2: End")
        }
        
        // Wait for all tasks in the group to finish
        dispatchGroup.wait()
        print("All tasks are done!")
    }
}

