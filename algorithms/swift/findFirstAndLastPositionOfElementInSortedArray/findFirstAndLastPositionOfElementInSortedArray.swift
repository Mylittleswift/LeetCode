/*
 34. Find First and Last Position of Element in Sorted Array

 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.

 Your algorithm's runtime complexity must be in the order of O(log n).

 If the target is not found in the array, return [-1, -1].

 Example 1:

 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 Example 2:

 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]

 https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/
 */
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty, 
        target >= nums[0], 
        target <= nums[nums.endIndex-1] else { 
            return [-1, -1] 
        }

        let index = binarySearch(nums, target)
        guard index != -1 else { return [-1, -1] }

        var left = index
        var right = index

        while left > 0, nums[left] == nums[left-1] {
            left -= 1
        }

        while right < nums.count-1, nums[right] == nums[right+1] {
            right += 1
        }

        return [left, right]

    }

    func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var lo = 0
        var hi = nums.count - 1
        while lo <= hi {
            var mid = (hi - lo) / 2 + lo
            if nums[mid] == target {
                return mid
            } else if nums[mid] > target {
                hi = mid - 1
            } else {
                lo = mid + 1
            }
        }
        return -1
    }
}
