import Foundation



// stack implementation in mutable array
public struct StackInArray<T> {
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

