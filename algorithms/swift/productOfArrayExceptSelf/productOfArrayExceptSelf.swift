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
*/

func productExceptSelf(_ nums: [Int]) -> [Int] {
    
    var output = [nums[0]]
    let n = nums.count
 
    for i in 1..<n {
        output.append(output[i-1]*nums[i])
    }
    
    var rightProduct = nums[n-1]
    output[n-1] = output[n-2]
    for i in (1..<n-1).reversed() {
        output[i] = output[i-1] * rightProduct
        rightProduct = rightProduct * nums[i]
    }
    output[0] = rightProduct
    
    return output
}