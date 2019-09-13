/*
 145. Binary Tree Postorder Traversal

 Given a binary tree, return the postorder traversal of its nodes' values.

 Example:

 Input: [1,null,2,3]
 1
 \
 2
 /
 3

 Output: [3,2,1]
 Follow up: Recursive solution is trivial, could you do it iteratively?

 https://leetcode.com/problems/binary-tree-postorder-traversal/
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
    var result = [Int]()
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        dfs(root)
        return result
    }

    private func dfs(_ root: TreeNode?) {
        guard let root = root else { return }
        dfs(root.left)
        dfs(root.right)
        result.append(root.val)
    }
}
