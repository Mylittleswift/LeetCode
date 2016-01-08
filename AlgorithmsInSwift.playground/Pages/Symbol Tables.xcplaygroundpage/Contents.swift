//: [Previous](@previous)

import Foundation

public final class TreeNode<Key: Comparable, Value>{
    let key: Key
    var value: Value
    var left: TreeNode?
    var right: TreeNode?
    var size: UInt //nodes in subtree rooted here
    
    init(key:Key, value:Value, size: UInt) {
        self.key = key
        self.value = value
        self.size = size
    }
}

/*

Definition. A binary search tree (BST) is a binary tree where each node has a Comparable Key (and an associated value) and satisfies the restriction that the key
in any node is larger than the keys in all nodes in that node's left subtree and smaller than the keys in all nodes in that node's right subtree.
*/
public final class BinarySearchTree <Key:Comparable, Value>
{

    typealias Node = TreeNode<Key, Value>
    
    private var root: Node?
    
    init () {
        self.root = nil
    }
    
    public func size() -> UInt {
        return self.size(root)
    }

    private func size(node: Node?) -> UInt {
        if let node = node {
            return node.size
        } else {
            return 0
        }
    }
    
    public func get(key:Key) -> Value? {
        return self.get(root, key: key)
    }

    //Return value associated with key in the subtree rooted at node;
    //return nil if key not present in subtree rooted at node.
    private func get(node:Node?, key:Key) -> Value?{
        if let node = node {
            if key < node.key {
                return self.get(node.left, key: key)
            } else if key > node.key {
                return self.get(node.right, key: key)
            } else {
                return node.value
            }
        } else {
            return nil
        }
    }
    
    //Search for key. Update value if found; grow table if new.
    public func put(key:Key, value:Value) {
        self.root = self.put(self.root, key: key, value: value)
    }
    
    //Change key's value if key in subtree rooted at node.
    //Otherwise, add new node to subtree associating key with value.
    private func put(node:Node?, key:Key, value:Value) -> Node {
        if let node = node {
            if key < node.key {
                node.left = self.put(node.left, key: key, value: value)
            } else if key > node.key {
                node.right = self.put(node.right, key: key, value: value)
            } else {
                node.value = value
            }
            //update tree size
            node.size = self.size(node.left) + self.size(node.right) + 1
            return node
        } else {
            return Node(key: key, value: value, size: 1)
        }
    }
    
    public func min() -> Key? {
        return self.min(self.root)?.key
    }
    
    private func min(node:Node?) -> Node? {
        if let left = node?.left {
            return self.min(left)
        } else {
            return node?.left
        }
    }
    
    public func deleteMin() {
        self.root = self.deleteMin(root)
    }
    
    private func deleteMin(node: Node?) -> Node?{
        if let node = node?.left {
            node.left = self.deleteMin(node.left)
            node.size = self.size(node.left) + self.size(node.right) + 1
            return node
        } else {
            return node?.right
        }
    }
    
    public func delete(key:Key) {
        self.root = self.delete(self.root, key: key)
    }
    
    private func delete(n:Node?, key:Key) -> Node? {
        
        var node = n
        
        if node == nil {
            return nil
        }
        
        if key < node?.key {
            node?.left = self.delete(node?.left, key: key)
        } else if key > node?.key {
            node?.right = self.delete(node?.right, key: key)
        } else {
            if node?.left == nil {
                return node?.right
            }
            
            if node?.right == nil {
                return node?.left
            }
            
            let tmp = node
            node = self.min(tmp?.right)
            node?.right = self.deleteMin(tmp?.right)
            node?.left = tmp?.left
        }
        node?.size = self.size(node?.left) + self.size(node?.right) + 1
        return node
    }
}

let bst = BinarySearchTree<Int, String>()
bst.size()
bst.put(0, value: "first")
bst.put(1, value: "second")
bst.size()
bst.get(1)
bst.deleteMin()
bst.size()
bst.get(5)



let bst1 = BinarySearchTree<String, String>()
bst1.put("a", value: "a")
bst1.put("c", value: "c")
bst1.put("e", value: "e")
bst1.put("r", value: "r")
bst1.put("h", value: "h")
bst1.put("m", value: "m")
bst1.put("s", value: "s")
bst1.put("x", value: "x")

bst1.size()
bst1.delete("e")
bst1.get("s")


public final class RBTreeNode<Key: Comparable, Value>{
    let key: Key
    var value: Value
    var left: RBTreeNode?
    var right: RBTreeNode?
    var size: UInt //nodes in subtree rooted here
    var color: Bool //color of link from parent to this node
    
    init(key:Key, value:Value, size: UInt, color: Bool) {
        self.key = key
        self.value = value
        self.size = size
        self.color = color
    }
}


public final class RedBlackBST <Key:Comparable, Value>
{
    typealias Node = RBTreeNode<Key, Value>
    private let RED = true
    private let BLACK = false
    
    private var root: Node?
    
    init () {
        self.root = nil
    }
    
    public func size() -> UInt {
        return self.size(root)
    }
    
    private func size(node: Node?) -> UInt {
        if let node = node {
            return node.size
        } else {
            return 0
        }
    }
    
    public func get(key:Key) -> Value? {
        return self.get(root, key: key)
    }
    
    //Return value associated with key in the subtree rooted at node;
    //return nil if key not present in subtree rooted at node.
    private func get(node:Node?, key:Key) -> Value?{
        if let node = node {
            if key < node.key {
                return self.get(node.left, key: key)
            } else if key > node.key {
                return self.get(node.right, key: key)
            } else {
                return node.value
            }
        } else {
            return nil
        }
    }
    
    //Search for key. Update value if found; grow table if new.
    public func put(key:Key, value:Value) {
        self.root = self.put(self.root, key: key, value: value)
        self.root?.color = BLACK
    }
    
    //Change key's value if key in subtree rooted at node.
    //Otherwise, add new node to subtree associating key with value.
    private func put(node:Node?, key:Key, value:Value) -> Node? {
        
        if var node = node {
            if key < node.key {
                node.left = self.put(node.left, key: key, value: value)
            } else if key > node.key {
                node.right = self.put(node.right, key: key, value: value)
            } else {
                node.value = value
            }
            
            if isRed(node.right) && !isRed(node.left) {
                node = rotateLeft(node)
            }
            
            if isRed(node.left) && isRed(node.left?.left) {
                node = rotateRight(node)
            }
            
            if isRed(node.left) && isRed(node.right) {
                flipColors(node)
            }
            
            //update tree size
            node.size = self.size(node.left) + self.size(node.right) + 1
            return node
        } else {
            return Node(key: key, value: value, size: 1, color: RED)
        }
    }
    
    private func isRed(node: Node?) -> Bool {
        if let node = node {
            return node.color == RED
        } else {
            return false
        }
    }
    
    private func rotateLeft(h: Node) -> Node {
        assert(isRed(h.right))

        let x = h.right!
        h.right = x.left
        x.left = h
        x.color = h.color
        h.color = RED
        x.size = h.size
        h.size = 1 + size(h.left) + size(h.right)
        return x
    }
    
    private func rotateRight(h: Node) -> Node {
        
        assert(isRed(h.left))
        
        let x = h.left!
        h.left = x.right
        x.right = h
        x.color = h.color
        h.color = RED
        x.size = h.size
        h.size = 1 + size(h.left) + size(h.right)
        return x
    }
    
    private func flipColors(node: Node) {
        node.color = RED
        node.left?.color = BLACK
        node.right?.color = BLACK
    }
}

