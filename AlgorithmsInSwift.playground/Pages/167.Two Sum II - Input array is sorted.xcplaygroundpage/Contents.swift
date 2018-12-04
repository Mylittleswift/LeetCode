// https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
import Foundation

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    
    var startIndex = 0
    var endIndex = numbers.count - 1
    
    while (numbers[startIndex] + numbers[endIndex] != target && startIndex < endIndex) {
        if numbers[startIndex] + numbers[endIndex] > target {
            endIndex -= 1
        } else {
            startIndex += 1
        }
    }
    
    return [startIndex+1, endIndex+1]
}

print(twoSum([2,7,11,15], 9))

