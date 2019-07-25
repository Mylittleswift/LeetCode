/*
 560. Subarray Sum Equals K

 Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.

 Example 1:
 Input:nums = [1,1,1], k = 2
 Output: 2
 Note:
 1.The length of the array is in range [1, 20,000].
 2.The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].

 https://leetcode.com/problems/subarray-sum-equals-k/
 */
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        var sum = 0
        var dic = [Int:Int]()
        dic[0] = 1
        for i in nums.indices {
            sum += nums[i]
            if let val = dic[sum-k] {
                count += val
            }
            dic[sum] = dic[sum, default:0] + 1
        }
        return count
    }
}
