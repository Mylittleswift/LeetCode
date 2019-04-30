/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 For example, given n = 3, a solution set is:

 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]

 https://leetcode.com/problems/generate-parentheses/
 */

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: String
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: String) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */


class Solution {
    public class PNode {
        public var val: String
        public var left: PNode?
        public var right: PNode?
        public init(_ val: String) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }

    var result = [String]()

    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else { return [""] }

        let root = PNode("(")
        construct(root, n-1, n)

        dfs(root, "")

        return result

    }

    func dfs(_ node: PNode, _ path: String) {

        var p = path

        p.append(node.val)

        if node.left == nil && node.right == nil { result.append(p) }

        if let left = node.left {
            dfs(left, p)
        }

        if let right = node.right {
            dfs(right, p)
        }
    }


    func construct(_ node: PNode, _ leftNum: Int, _ rightNum: Int) {

        if leftNum == 0 && rightNum == 0 { return }

        if node.val == "(" {
            if leftNum > 0 {
                let l = PNode("(")
                node.left = l
                construct(l, leftNum-1, rightNum)
            }
            if rightNum > 0 {
                let r = PNode(")")
                node.right = r
                construct(r, leftNum, rightNum-1)
            }
        } else {
            if rightNum > leftNum {
                let r = PNode(")")
                node.right = r
                construct(r, leftNum, rightNum-1)
            }

            if leftNum > 0 {
                let l = PNode("(")
                node.left = l
                construct(l, leftNum-1, rightNum)
            }
        }
    }

}
