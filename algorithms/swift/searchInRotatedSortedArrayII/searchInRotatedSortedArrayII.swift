/*
Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

(i.e., [0,0,1,2,2,5,6] might become [2,5,6,0,0,1,2]).

You are given a target value to search. If found in the array return true, otherwise return false.

Example 1:
Input: nums = [2,5,6,0,0,1,2], target = 0
Output: true

Example 2:

Input: nums = [2,5,6,0,0,1,2], target = 3
Output: false

Follow up:

* This is a follow up problem to Search in Rotated Sorted Array, where nums may contain duplicates.
* Would this affect the run-time complexity? How and why?

*/

func search(_ nums: [Int], _ target: Int) -> Bool {
    
    guard nums.count > 3 else {return nums.contains(target)}
    
    
    var start = 0
    var end = nums.count-1
    var mid = -1
    
    while start <= end {
        mid = (end - start)/2 + start
        
        if nums[mid] == target { return true }
        
        if nums[start] == nums[mid] && nums[mid] == nums[end] {
            start = start + 1
            end = end - 1
        } else if nums[start] <= nums[mid] {
            if nums[start] <= target && target < nums[mid] {
                end = mid - 1
            } else {
                start = mid + 1
            }
        } else {
            if nums[mid] < target && target <= nums[end] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }
        
    }
    return false
}
