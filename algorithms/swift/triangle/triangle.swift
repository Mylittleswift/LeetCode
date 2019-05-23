/*
 Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.

 For example, given the following triangle

 [
 [2],
 [3,4],
 [6,5,7],
 [4,1,8,3]
 ]

 The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).

 Note:

 Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.


 https://leetcode.com/problems/triangle/
 */

struct Position: Hashable {
    let row: Int
    let col: Int
}

var memo = [Position: Int]()

func minimumTotal(_ triangle: [[Int]]) -> Int {

    guard triangle.count > 1 else { return triangle[0][0] }

    let head = triangle[0][0]
    return head + min(_helper(triangle,1,0), _helper(triangle,1,1))
}

func _helper(_ triangle: [[Int]], _ row: Int, _ col: Int) -> Int {

    let pos = Position(row: row, col: col)
    let n = triangle.count

    guard row != n-1 else {
        memo[pos] = triangle[row][col]
        return memo[pos]!
    }

    if let val = memo[pos] {
        return val
    }

    memo[pos] = min(_helper(triangle, row+1, col), _helper(triangle, row+1, col+1)) + triangle[row][col]
    return memo[pos]!
}
