/*
 33. Search in Rotated Sorted Array

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

https://leetcode.com/problems/search-in-rotated-sorted-array/
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else { return -1 }

    var lo = 0
    var hi = nums.count - 1
    while lo < hi {
        let mid = lo + (hi - lo) / 2
        // target and mid are on the same side
        if (nums[mid] - nums[nums.count-1]) * (target - nums[nums.count-1]) > 0 {
            if nums[mid] < target {
                lo = mid + 1
            } else {
                hi = mid
            }
        } else if target > nums[nums.count-1] {
            // target on the left side
            hi = mid
        } else {
            // target on the right side
            lo = mid + 1
        }
    }

    // hi == lo
    return nums[lo] == target ? lo : -1
}