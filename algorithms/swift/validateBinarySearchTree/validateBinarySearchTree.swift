/*
 Given a binary tree, determine if it is a valid binary search tree (BST).

 Assume a BST is defined as follows:

 * The left subtree of a node contains only nodes with keys less than the node's key.
 * The right subtree of a node contains only nodes with keys greater than the node's key.
 * Both the left and right subtrees must also be binary search trees.

 https://leetcode.com/problems/validate-binary-search-tree/

 */
var stack = [TreeNode]()

func isValidBST(_ root: TreeNode?) -> Bool {

    guard let root = root else { return true }

    pushNode(root)

    for i in 0..<stack.count-1 {
        let t1 = stack[i]
        let t2 = stack[i+1]
        if t1.val >= t2.val { return false }
    }
    return true
}

func pushNode(_ node: TreeNode?) {
    guard let node = node else { return }
    if node.left == nil && node.right == nil {
        stack.append(node)
    } else {
        pushNode(node.left)
        stack.append(node)
        pushNode(node.right)
    }
}
