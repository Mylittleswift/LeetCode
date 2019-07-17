/*

 215. Kth Largest Element in an Array


 Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Example 1:

 Input: [3,2,1,5,6,4] and k = 2
 Output: 5


 Example 2:

 Input: [3,2,3,1,2,4,5,5,6] and k = 4
 Output: 4

 Note:

 You may assume k is always valid, 1 ≤ k ≤ array's length.


 https://leetcode.com/problems/kth-largest-element-in-an-array/
 */

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {

    var nums = nums
    var start = 0
    var end = nums.count-1
    var index = nums.count-k
    while(start <= end){
        var position = partition(&nums, start, end)
        if(position == index){
            return nums[position]
        } else if(position < index){
            start = position + 1
        } else{
            end = position - 1
        }
    }
    return -1
}

func partition(_ nums: inout [Int], _ start: Int, _ end:  Int) -> Int{
    var index = start
    var pivot = nums[start]
    var start = start
    var end = end

    while(start <= end){

        while(start <= end && nums[start] <= pivot){
            start += 1
        }
        while(start <= end && nums[end] >= pivot){
            end -= 1
        }
        if(start <= end){
            nums.swapAt(start, end)
            start += 1
            end -= 1
        }
    }
    nums.swapAt(index, end)
    return end
}
