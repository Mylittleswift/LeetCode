/*
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

 For example:
 Given binary tree [3,9,20,null,null,15,7],

 return its level order traversal as:

 [
 [3],
 [9,20],
 [15,7]
 ]

 https://leetcode.com/problems/binary-tree-level-order-traversal/
 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */
class Solution {

    var queue = [TreeNode]()

    func levelOrder(_ root: TreeNode?) -> [[Int]] {

        guard let root = root else { return [] }

        var result = [[Int]]()

        var levelNodes = [TreeNode]()
        levelNodes.append(root)

        while !levelNodes.isEmpty {
            result.append(levelNodes.map{ $0.val })
            levelNodes = traverse(levelNodes)
        }

        return result
    }

    //next level nodes
    func traverse(_ nodes: [TreeNode]) -> [TreeNode] {
        var next = [TreeNode]()
        for node in nodes {
            if let left = node.left {
                next.append(left)
            }
            if let right = node.right {
                next.append(right)
            }
        }
        return next
    }
}
