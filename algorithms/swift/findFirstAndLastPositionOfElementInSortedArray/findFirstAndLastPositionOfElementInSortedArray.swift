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

        var result = [-1,-1]
        guard nums.count > 0 else { return result }

        var low = 0
        var high = nums.count - 1

        //finding left point
        while(low < high) {
            let mid = low + (high - low) / 2
            if(nums[mid] < target) {
                low = mid + 1
            } else {
                high = mid
            }
        }

        guard nums[low] == target else {
            return result
        }

        result[0] = low

        //find right end
        high = nums.count - 1
        while (low < high) {
            let mid = low + (high - low) / 2 + 1
            if(nums[mid] > target) {
                high = mid - 1
            } else {
                low = mid
            }
        }

        result[1] = high

        return result
    }
}
