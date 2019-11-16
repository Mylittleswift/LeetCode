/*
 46. Permutations

 Given a collection of distinct integers, return all possible permutations.

 Example:

 Input: [1,2,3]
 Output:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]

 https://leetcode.com/problems/permutations/
 */
class Solution {
    var result = [[Int]]()

    func permute(_ nums: [Int]) -> [[Int]] {
        helper(nums, 0)
        return result
    }

    func helper(_ nums: [Int], _ start: Int) {
        var nums = nums
        if start == (nums.count - 1) {
            result.append(nums)
        }
        for i in start..<nums.count {
            nums.swapAt(i, start)
            helper(nums, start+1)
        }
    }
}
