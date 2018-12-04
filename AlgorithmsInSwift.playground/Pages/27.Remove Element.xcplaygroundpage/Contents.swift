//https://leetcode.com/problems/remove-element/
import Foundation

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var length = 0
    let count = nums.count
    for (index, value) in nums.enumerated() {
        if value == val {
            nums.remove(at: (index - length))
            length += 1
        }
    }
    return count - length
}

var a1 = [3,2,2,3]
print(removeElement(&a1, 3))


var a2 = [0,1,2,2,3,0,4,2]
print(removeElement(&a2, 2))

var a3 = [1]
print(removeElement(&a3, 1))
