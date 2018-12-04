//https://leetcode.com/problems/array-partition-i/

import Foundation

func arrayPairSum(_ nums: [Int]) -> Int {
    var sorted = nums
    sorted.sort { $0 < $1 }
    var result = 0
    let count = nums.count/2
    for i in 0..<count {
        result += sorted[i * 2]
    }
    return result
}

print(arrayPairSum([1,4,3,2]))
