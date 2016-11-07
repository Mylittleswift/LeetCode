//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


class Node <T> {
    var item: T? = nil
    var next: Node? = nil
}

public class LinkedStack<T: Equatable> {
    
    private var first: Node<T>?
    
    public func isEmpty() -> Bool {
        return first?.item == nil
    }
     
    public func push(_ item: T) {
        
        let current: Node<T>? = first
        first = Node<T>()
        first!.item = item
        first?.next = current
        
    }
    
    public func pop() -> T? {
        let item: T? = first?.item
        first = first?.next
        return item
    }
    
}

var list : LinkedStack<String> = LinkedStack<String>()

list.push("test")
list.push("push one")

list.pop()
list.pop()
list.isEmpty()

var list_int: LinkedStack<Int> = LinkedStack<Int>()

list_int.isEmpty()
list_int.push(1)
list_int.push(2)
list_int.pop()
list_int.pop()
list_int.pop()
list_int.isEmpty()


public class LinkedQueue <T: Equatable> {
    
    private var first, last: Node<T>?
    
    public func isEmpty() -> Bool {
        return first?.item == nil
    }
    
    public func enqueue(_ item: T) -> Void{
        let oldlast: Node? = last
        last = Node<T>()
        last!.item = item
        last!.next = nil
        
        //special cases for empty queue
        if isEmpty() {
            first = last
        } else {
            oldlast?.next = last;
        }
    }
    
    public func dequeue() -> T? {
        let item: T? = first?.item
        first = first?.next
        
        //special cases for empty queue
        if isEmpty() {
            last = nil
        }
        return item
    }
}


var list_queue: LinkedQueue<String> = LinkedQueue<String>()

list_queue.isEmpty()
list_queue.enqueue("first")
list_queue.enqueue("second")
list_queue.isEmpty()
list_queue.dequeue()
list_queue.dequeue()
list_queue.dequeue()
list_queue.isEmpty()

