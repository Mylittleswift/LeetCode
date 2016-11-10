//: [Previous](@previous)

import Foundation

public class Node<K: Comparable, V> {
    var left: Node?
    var right: Node?
    let key: K
    var value: V
    var size: UInt//nodes in subtree rooted here
    
    init(key: K, value: V, size: UInt) {
        self.key = key
        self.value = value
        self.size = size
    }
}

public class BinarySearchTree<K: Comparable, V> {
    
    typealias BSTNode = Node<K,V>
    fileprivate var root: BSTNode?

    public func size() -> UInt {
        return size(node: root)
    }
    
    private func size(node: BSTNode?) -> UInt {
        guard let node = node else {
            return 0
        }
        return node.size
    }
    
    public func get(key: K) -> V? {
        return get(node: root, key: key)
    }
    
    
    private func get(node: BSTNode?, key: K) -> V? {
        guard let node = node else {
            return nil
        }
        if key > node.key { return get(node: node.right, key: key) }
        else if key < node.key { return get(node: node.left, key: key) }
        else { return node.value }
    }
    
    public func put(key: K, value: V) {
        root = put(node: root, key: key, value: value)
    }
    
    private func put(node: BSTNode?, key: K, value: V) -> BSTNode {
        guard let node = node else {
            return BSTNode(key: key, value: value, size: 1)
        }
        if key > node.key {
            node.right = put(node: node.right, key: key, value: value)
        } else if key < node.key {
            node.left = put(node: node.left, key: key, value: value)
        } else {
            node.value = value
        }
        node.size = size(node: node.left) + size(node: node.right)
        return node
    }
}

let bst = BinarySearchTree<Int, String>()
bst.put(key: 6, value: "root")
bst.put(key: 1, value: "left")
bst.put(key: 7, value: "right")
bst.size()
bst.get(key: 1)
bst.get(key: 7)
bst.get(key: 6)





