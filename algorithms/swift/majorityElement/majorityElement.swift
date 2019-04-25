/*
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

 You may assume that the array is non-empty and the majority element always exist in the array.


 e.g 1

 Input: [3,2,3]
 Output: 3

 e.g 2

 Input: [2,2,1,1,1,2,2]
 Output: 2

 https://leetcode.com/problems/majority-element/

 */

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return nums[0] }

        var memo = [Int: Int]() //value: count

        for i in 0..<nums.count {
            let num = nums[i]
            if var count = memo[num] {
                count = count + 1
                if count >= (nums.count + 1)/2 {
                    return num
                }
                memo[num] = count
            } else {
                memo[num] = 1
            }
        }
        return nums[0]
    }
}
