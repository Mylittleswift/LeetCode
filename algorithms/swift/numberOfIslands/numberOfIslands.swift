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

        let dxy = [(0,1), (0,-1), (1,0), (-1,0)]

        dxy.forEach { d in
            let r = row+d.0
            let c = col+d.1
            if r >= 0 && r < grid.count &&
               c >= 0 && c < grid[0].count &&
               grid[r][c] == 1 {
                grid[r][c] = current
                dfs(row+d.0, col+d.1)
            }
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
