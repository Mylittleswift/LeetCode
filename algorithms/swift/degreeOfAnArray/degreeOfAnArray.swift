/*
Given a non-empty array of non-negative integers nums, 
the degree of this array is defined as the maximum frequency of any one of its elements.

Your task is to find the smallest possible length of a (contiguous) subarray of nums, 
that has the same degree as nums.

Example 1:
Input: [1, 2, 2, 3, 1]
Output: 2
Explanation: 
The input array has a degree of 2 because both elements 1 and 2 appear twice.
Of the subarrays that have the same degree:
[1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
The shortest length is 2. So return 2.

Example 2:
Input: [1,2,2,3,1,4,2]
Output: 6

Note:

* nums.length will be between 1 and 50,000.
* nums[i] will be an integer between 0 and 49,999.
*/

func findShortestSubArray(_ nums: [Int]) -> Int {
    
    var dic = [Int:[Int]]()
    var max = 0
    for i in 0..<nums.count {
        var count = 1
        if var array = dic[nums[i]] {
            array.append(i)
            count = array.count
            dic[nums[i]] = array
        } else {
            dic[nums[i]] = [i]
        }
        if count > max { max = count }
    }
    var min = Int.max
    for v in dic.values {
        if v.count == max {
            let t = v.last! - v.first!
            if min > t { min = t }
        }
    }
    return min+1
}