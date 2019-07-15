/*
 236. Lowest Common Ancestor of a Binary Tree

 Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

 Given the following binary tree:  root = [3,5,1,6,2,0,8,null,null,7,4]

 e.g 1
 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 Output: 3
 Explanation: The LCA of nodes 5 and 1 is 3.

 e.g 2
 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 Output: 5
 Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.

 https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/
 */

func lowestCommonAncestor(root: TreeNode?, p: TreeNode?, q: TreeNode?) -> TreeNode? {

    guard let root = root else { return nil }

    var stack = [TreeNode?]()
    var result = [TreeNode?]()

    stack.append(root)
    let fake = TreeNode(0) // easy to calculate index
    result.append(fake)
    result.append(root)
    while !stack.isEmpty {
        let node = stack.removeFirst()
        if let n = node {
            stack.append(n.left)
            stack.append(n.right)

            result.append(node?.left)
            result.append(node?.right)

        }
    }

    let pIndex = result.firstIndex { node -> Bool in
        return node === p
    }

    let qIndex = result.firstIndex { node -> Bool in
        return node === q
    }

    if var pIndex = pIndex, var qIndex = qIndex {
        while pIndex != qIndex {
            if pIndex > qIndex {
                pIndex = pIndex / 2
            } else {
                qIndex = qIndex / 2
            }
        }
        return result[pIndex]
    }
    return nil
}
