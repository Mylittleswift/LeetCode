/*
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

You are given a target value to search. If found in the array return its index, otherwise return -1.

You may assume no duplicate exists in the array.

Your algorithm's runtime complexity must be in the order of O(log n).

Example 1:

Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4

Example 2:

Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
*/

func search(_ nums: [Int], _ target: Int) -> Int {
        
        if nums.count == 1 {
            return nums[0] == target ? 0 : -1
        } else if nums.count == 2 {
            let n1 = nums[0]
            let n2 = nums[1]
            if n1 == target { return 0 }
            else { return n2 == target ? 1 : -1 }
        }
    
        return helper(nums, 0, (nums.count-1)/2, nums.count-1, target)
        
    }
    
func helper(_ nums: [Int], _ lo: Int, _ mid: Int, _ hi: Int, _ target: Int) -> Int {
    
    guard lo < hi, lo < mid else { return -1 }
    if nums[lo] == target { return lo }
    else if nums[mid] == target { return mid }
    else if nums[hi] == target { return hi }
    
    if nums[mid] > nums[lo] {
        if target > nums[lo] && target < nums[mid] {
            // search left
            return helper(nums, lo, (mid-lo)/2 + lo, mid, target)
        } else {
            // search right
            return helper(nums, mid, (hi-mid)/2 + mid, hi, target)
        }
    } else {
        if target > nums[mid] && target < nums[hi] {
            // search right
            return helper(nums, mid, (hi-mid)/2 + mid, hi, target)
        } else {
            // search left
            return helper(nums, lo, (mid-lo)/2 + lo, mid, target)
        }
    }
}