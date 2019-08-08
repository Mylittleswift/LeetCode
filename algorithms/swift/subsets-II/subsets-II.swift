/*
 90. Subsets II

 Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).

 Note: The solution set must not contain duplicate subsets.

 Example:

 Input: [1,2,2]
 Output:
 [
 [2],
 [1],
 [1,2,2],
 [2,2],
 [1,2],
 []
 ]

 https://leetcode.com/problems/subsets-ii/
 */

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()

        result.append([Int]())

        for i in nums.indices {
            for var set in result {
                set.append(nums[i])
                result.append(set.sorted())
            }
        }

        return Array(Set(result))
    }
}
