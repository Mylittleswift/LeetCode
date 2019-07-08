/*
Given an array nums of n integers where n > 1,  
return an array output such that output[i] is equal to the product of 
all the elements of nums except nums[i].

Example:

Input:  [1,2,3,4]
Output: [24,12,8,6]

Note: Please solve it without division and in O(n).

Follow up:
Could you solve it with constant space complexity? 
(The output array does not count as extra space for the purpose of space complexity analysis.)

https://leetcode.com/problems/product-of-array-except-self/
*/

func productExceptSelf(_ nums: [Int]) -> [Int] {

    var output = [nums[0]]
    let n = nums.count
    // first, calculate left product
    for i in 1..<n {
        output.append(output[i-1]*nums[i])
    }

    // right product
    var rightProduct = nums[n-1]
    output[n-1] = output[n-2]
    for i in (1..<n-1).reversed() {
        // product left and right
        output[i] = output[i-1] * rightProduct
        // update right
        rightProduct = rightProduct * nums[i]
    }
    // update first
    output[0] = rightProduct

    return output
}
