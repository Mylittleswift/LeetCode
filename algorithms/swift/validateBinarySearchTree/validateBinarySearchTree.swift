/*
 Given a binary tree, determine if it is a valid binary search tree (BST).

 Assume a BST is defined as follows:

 * The left subtree of a node contains only nodes with keys less than the node's key.
 * The right subtree of a node contains only nodes with keys greater than the node's key.
 * Both the left and right subtrees must also be binary search trees.

 https://leetcode.com/problems/validate-binary-search-tree/

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
    var inorder = [Int]()
    func isValidBST(_ root: TreeNode?) -> Bool {
        inorderTraversal(root)
        for (index, _) in inorder.enumerated() where index < inorder.count-1 {
            if inorder[index] >= inorder[index+1] {
                return false
            }
        }
        return true
    }

    func inorderTraversal(_ root: TreeNode?) {
        guard let root = root else { return }
        if root.left == nil, root.right == nil {
            inorder.append(root.val)
        } else {
            inorderTraversal(root.left)
            inorder.append(root.val)
            inorderTraversal(root.right)
        }
    }
}
