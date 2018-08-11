//: Playground - noun: a place where people can play


//https://leetcode.com/articles/find-pivot-index/


class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        
        guard nums.count > 1 else { return nums.isEmpty ? -1 : 0 }
        
        let sum = nums.reduce(0, +)
        
        if sum - nums[0] == 0 { return 0 }
        
        var leftTotal = 0
        for i in 1..<nums.count {
            leftTotal += nums[i-1]
            if (sum - leftTotal - nums[i]) == leftTotal {
                return i;
            }
        }
        
        return -1
    }
}


let s = Solution()
//[1, 7, 3, 6, 5, 6]
//s.pivotIndex([-1,-1,-1,0,1,1])
//s.pivotIndex([1, 7, 3, 6, 5, 6])
//s.pivotIndex([-1,-1,0,1,0,-1])
//s.pivotIndex([-1,-1,0,1,1,0])
s.pivotIndex([-1,-1,1,1,0,0])
