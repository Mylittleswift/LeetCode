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

// stack implementation in linkedList
class Node<T> {
    let value: T
    var next: Node<T>?
    
    init(value: T, next: Node<T>?) {
        self.value = value
        self.next = next
    }
}

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

//extension StackInLinkedList : CustomDebugStringConvertible {
//    public var debugDescription: String {
//        var node = self._top
//        while let value = node?.value {
//            node = node?.next
//            print("\(value)")
//        }
//        return ""
//    }
//}

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





