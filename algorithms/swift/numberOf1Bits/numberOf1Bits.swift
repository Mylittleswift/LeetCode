/*
 https://leetcode.com/problems/number-of-1-bits/
 */
func hammingWeight(_ n: UInt) -> UInt {
    var count: UInt = 0
    var n = n
    while n != 0 {
        count = count + (a & 1)
        n = n >> 1
    }
    return count
}
