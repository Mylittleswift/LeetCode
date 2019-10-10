/*
https://leetcode.com/problems/maximum-binary-tree/discuss/244547/Swift-O(N)-faster-than-100.00
*/
class Solution {
    
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        var stack = [TreeNode]()
        
        for i in 0..<nums.count {
            var cur = TreeNode(nums[i])
            while let last = stack.last, last.val < nums[i] {
                cur.left = last
                stack.popLast()
            }
            if (!stack.isEmpty) {
                stack.last?.right = cur
            }
            stack.append(cur)
        }
        return stack.first
    }
}
