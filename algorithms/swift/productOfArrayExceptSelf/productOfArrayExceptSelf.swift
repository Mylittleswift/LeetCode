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
    var left = [nums[0]]
    var right = [nums.last!]
    let n = nums.count

    for i in 1..<n {
        left.append(left[i-1]*nums[i])
        right.append(right[i-1]*nums[n-i-1])
    }
    
    right = right.reversed()

    var output = [right[1]]
    for i in 1..<n-1 {
        output.append(left[i-1]*right[i+1])
    }
    output.append(left[n-2])
    
    return output
}