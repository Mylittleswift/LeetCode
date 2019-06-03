/*
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:

 Input:
 11110
 11010
 11000
 00000

 Output: 1

 Example 2:

 Input:
 11000
 11000
 00100
 00011

 Output: 3
 */

func numIslands(_ grid: [[Character]]) -> Int {

    guard grid.count > 0 else { return 0 }

    var current = 2

    var grid = grid.map { $0.map { Int(String($0))! } }

    func dfs(_ row: Int, _ col: Int) {
        // up
        if row - 1 >= 0 && grid[row-1][col] == 1 {
            grid[row-1][col] = current
            dfs(row-1, col)
        }

        // down
        if row + 1 < grid.count && grid[row+1][col] == 1 {
            grid[row+1][col] = current
            dfs(row+1, col)
        }

        // left
        if col - 1 >= 0 && grid[row][col-1] == 1 {
            grid[row][col-1] = current
            dfs(row, col-1)
        }

        // right
        if col + 1 < grid[0].count && grid[row][col+1] == 1 {
            grid[row][col+1] = current
            dfs(row, col+1)
        }
    }

    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            if grid[i][j] == 1 {
                dfs(i, j)
                current = current + 1
            }
        }
    }
    return current-2
}
