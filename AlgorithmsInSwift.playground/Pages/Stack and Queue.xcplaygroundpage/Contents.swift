import Foundation


public protocol StackType {
    associatedtype Eelement
    var isEmpty: Bool {get}
    var count: Int{get}
    mutating func push(_ item: Eelement)
    mutating func pop() -> Eelement?
}


// stack implementation in mutable array
public struct StackInArray<T>: StackType {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.count == 0
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public func peek() -> T? {
        return array.last
    }
}

extension StackInArray: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var curr = self
        return AnyIterator {
            _ -> T? in
            return curr.pop()
        }
    }
}

extension StackInArray: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "\(self.array)"
    }

}

var numbers = StackInArray(array: [1,2,3,4,5,6])
numbers.push(7)
print(numbers)
numbers.pop()
print(numbers)
numbers.peek()
print(numbers)
numbers.count
numbers.isEmpty

class Node<T> {
    let value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>?) {
        self.value = value
        self.next = next
    }
}

// stack implementation in linkedList
public struct StackInLinkedList<T>: StackType {
    
    private var _count: Int = 0
    //Node which on top of the stack
    fileprivate var _top: Node<T>? = nil
    
    public var isEmpty: Bool {
        return _count == 0
    }
    public var count: Int {
        return _count
    }
    public mutating func push(_ item: T) {
        let old = self._top
        self._top = Node(value: item, next: old)
        _count = _count + 1
    }
    
    public mutating func pop() -> T? {
        
        //if isEmpty return nil
        if isEmpty { return nil }
        let value = self._top?.value
        self._top = self._top?.next
        _count = _count - 1
        return value
    }
}

extension StackInLinkedList : CustomDebugStringConvertible {
    public var debugDescription: String {
        var s = "["
        var node = self._top
        while node != nil {
            s.append("\(node!.value)")
            node = node!.next
            if node != nil { s += ", " }
        }
        return s + "]"
    }
}

var linkedlist = StackInLinkedList<Int>()
linkedlist.push(1)

linkedlist.push(1)
linkedlist.push(2)
linkedlist.push(3)

print(linkedlist)

linkedlist.pop()
linkedlist.pop()

linkedlist.push(5)

linkedlist.count

linkedlist.isEmpty

linkedlist.pop()
linkedlist.pop()

linkedlist.isEmpty

linkedlist.pop()

linkedlist.push(5)

linkedlist.isEmpty

linkedlist.pop()

//Queue implementations
public protocol QueueType {
    associatedtype Item
    var isEmpty: Bool { get }
    var size: UInt { get }
    mutating func enqueue(_ item: Item)
    mutating func dequeue() -> Item?
}

public struct QueueInArray<T>: QueueType {
    
    fileprivate var _array = [T]()
    public var isEmpty: Bool { return _array.count == 0 }
    public var size: UInt { return UInt(_array.count) }
    
    public mutating func enqueue(_ item: T) {
        _array.append(item)
    }
    
    public mutating func dequeue() -> T? {
        if isEmpty { return nil }
        return _array.removeFirst()
    }
}

var qArray = QueueInArray<Int>()
qArray.enqueue(1)
qArray.enqueue(2)
qArray.enqueue(3)
qArray.dequeue()
qArray.dequeue()
qArray.dequeue()
qArray.isEmpty
qArray.size
qArray.enqueue(4)
qArray.dequeue()
qArray.dequeue()
qArray.dequeue()
qArray.dequeue()
qArray.enqueue(5)
qArray.size
qArray.dequeue()

public struct QueueInLinkedList<T>: QueueType {
    
    fileprivate var _size: UInt = 0
    fileprivate var _head: Node<T>? = nil
    fileprivate var _tail: Node<T>? = nil
    
    public var isEmpty: Bool { return _size == 0 }
    public var size: UInt { return _size }
    
    public mutating func enqueue(_ item: T) {

        let oldTail = _tail
        _tail = Node(value: item, next: nil)
        if (isEmpty) { _head = _tail }
        else { oldTail?.next = _tail }
        _size = _size + 1
    }
    
    public mutating func dequeue() -> T? {
        let value = _head?.value
        _head = _head?.next
        if (isEmpty) { _tail = nil }
        else { _size = _size - 1 }
        return value
    }
}

var qlinklist = QueueInLinkedList<Int>()
qlinklist.enqueue(1)
qlinklist.enqueue(2)
qlinklist.enqueue(3)
qlinklist.dequeue()
qlinklist.dequeue()
qlinklist.dequeue()
qlinklist.isEmpty
qlinklist.size
qlinklist.enqueue(4)
qlinklist.dequeue()
qlinklist.dequeue()
qlinklist.dequeue()
qlinklist.dequeue()
qlinklist.enqueue(5)
qlinklist.size
qlinklist.dequeue()






