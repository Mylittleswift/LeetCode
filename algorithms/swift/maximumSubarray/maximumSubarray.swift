/*
 53. Maximum Subarray

 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Example:

 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Follow up:

 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 */

func maxSubArray(_ nums: [Int]) -> Int {
    guard nums.count > 0 else { return 0 }
    var dp = [Int]()
    dp.append(nums[0])
    var result = dp[0]
    for i in 1..<nums.count {
        dp[i] = max(dp[i-1] + nums[i], nums[i])
        result = max(result, dp[i])
    }
    return result
}
