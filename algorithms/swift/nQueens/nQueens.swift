/*
 The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.

 Given an integer n, return all distinct solutions to the n-queens puzzle.

 Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.

 Example:

 Input: 4
 Output: [
 [".Q..",  // Solution 1
 "...Q",
 "Q...",
 "..Q."],

 ["..Q.",  // Solution 2
 "Q...",
 "...Q",
 ".Q.."]
 ]
 Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.
 */

class Solution {

    var flags = [[Bool]]()
    var solution = [[String]]()
    var result = [[String]]()

    func solveNQueens(_ n: Int) -> [[String]] {

        for _ in 0..<n {
            let t0 = Array(repeating: true, count: n)
            let t1 = Array(repeating: ".", count: n)

            flags.append(t0)
            solution.append(t1)
        }

        for i in 0..<n {
            let s = findSolution(board: solution, flags: flags, row:0, col:i)
            if s.count > 0 {result.append(contentsOf: s)}

        }

        return result
    }

    func findSolution(board: [[String]], flags:[[Bool]], row: Int, col: Int) -> [[String]] {


        var s = board
        var f = flags

        var tmp_sol = [[String]]()

        s[row][col] = "Q"
        f[row][col] = false


        f = updateFlags(f, row: row, col: col)

        for i in 0..<s.count {
            tmp_sol = [[String]]()
            if row + 1 < s.count {
                if f[row+1][i] {
                    let t = findSolution(board: s, flags: f, row: row+1, col: i)
                    let s = t.map { array in
                        array.joined()
                    }
                    if t.count>0 {result.append(s)}
                }
            } else {
                tmp_sol.append(contentsOf: s)
            }
        }
        return tmp_sol
    }

    func updateFlags(_ flags:[[Bool]], row: Int, col: Int) -> [[Bool]] {
        var _flags = flags
        let n = flags.count

        //down
        for i in row..<n {
            _flags[i][col] = false
        }
        //lower left
        var i = row
        var j = col
        while i < n && j >= 0 {
            _flags[i][j] = false
            i = i + 1
            j = j - 1
        }

        //lower right
        i = row
        j = col
        while i < n && j < n {
            _flags[i][j] = false
            i = i + 1
            j = j + 1
        }

        return _flags
    }

}
