import Foundation

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
}

// Copy On Write
extension LinkedList {
    fileprivate mutating func copyNodesIfNeeded() {
        
        guard !isKnownUniquelyReferenced(&head) else { return }
        guard var oldNode = head else { return }
        
        head = Node(value: oldNode.value)
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            
            oldNode = nextOldNode
        }
        tail = newNode
    }
}

// Adding values to the list
extension LinkedList {
    // O(1)
    public mutating func push(_ value: Value) {
        copyNodesIfNeeded()
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    // O(1)
    public mutating func append(_ value: Value) {
        copyNodesIfNeeded()
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        
        tail = tail!.next
    }
    
    // O(1)
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>) -> Node<Value> {
        copyNodesIfNeeded()
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
}

// Getting value
extension LinkedList {
    // O(n)
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
}

// Removing values from the list
extension LinkedList {
    // Removing a value at the front of the list
    // O(1)
    public mutating func pop() -> Value? {
        copyNodesIfNeeded()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    // Removing the last node
    // O(n)
    @discardableResult
    public mutating func removeLast() -> Value? {
        copyNodesIfNeeded()
        guard let head = head else { return nil }
        // list only contains one node, removeLast == pop
        guard head.next != nil else {
            return pop()
        }
        
        var prev = head
        var current = head
        
        while let next = current.next {
            prev = current
            current = next
        }

        // remove last node
        prev.next = nil
        // update tail
        tail = prev
        
        return current.value
    }
    
    // Removing a particular node
    // O(1)
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        copyNodesIfNeeded()
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
}

extension LinkedList: Collection {
    public struct Index: Comparable {
        public var node: Node<Value>?
        
        static public func ==(lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func <(lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
    
    public var startIndex: Index {
        return Index(node: head)
    }
    
    public var endIndex: Index {
        return Index(node: tail?.next)
    }
    
    public func index(after i: Index) -> Index {
        return Index(node: i.node?.next)
    }
    
    public subscript(postion: Index) -> Value {
        return postion.node!.value
    }
}

extension LinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}
