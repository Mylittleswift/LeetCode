//: [Previous](@previous)

import Foundation

public final class TreeNode<Key: Comparable, Value>{
    let key: Key
    var value: Value
    var left: TreeNode?
    var right: TreeNode?
    var size: UInt
    
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
}

let bst = BinarySearchTree<Int, String>()
bst.size()
bst.put(0, value: "first")
bst.put(1, value: "second")
bst.size()
bst.get(1)



