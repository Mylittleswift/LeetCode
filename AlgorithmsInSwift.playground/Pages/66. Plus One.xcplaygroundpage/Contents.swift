import Foundation

//https://leetcode.com/problems/plus-one/description/


class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        
        guard !digits.isEmpty else {
            return []
        }
        
        var result = digits
        //reverse iterate
        var needsPlusOne = true
        for index in stride(from: digits.count-1, to: -1, by: -1) {
            
            if needsPlusOne {
                result[index] += 1
            }
            
            if result[index] >= 10 {
                needsPlusOne = true
                result[index] -= 10
            } else {
                needsPlusOne = false
                break
            }
        }
        
        if needsPlusOne {
            result.insert(1, at:0)
        }
        return result
    }
}


let s = Solution()
s.plusOne([1,2,3])
s.plusOne([1,2,9])
s.plusOne([1,9,9])
s.plusOne([9,9,9])

