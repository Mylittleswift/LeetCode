
import Foundation

class Solution {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        
        guard !matrix.isEmpty else {
            return []
        }
        
        guard matrix.count > 1 && matrix[0].count > 1 else {
            if matrix.count == 1 {
                return matrix[0]
            }
            
            if matrix[0].count == 1 {
                return matrix.flatMap { return $0 }
            }
            return []
        }
        
        var x = 0
        var y = 0
        
        let row = matrix.count
        let col = matrix[0].count
        
        var result = [matrix[0][0]]
        var upside = false

        //i: number of diagonal
        for _ in 1...(row + col - 3) {
            if upside {
                if x + 1 >= row {
                    y = y + 1
                } else {
                    x = x + 1
                }

                while x >= 1 && y < col - 1 {
                    result.append(matrix[x][y])
                    x -= 1
                    y += 1
                }
                result.append(matrix[x][y])
            } else {
                if y + 1 >= col {
                    x = x + 1
                } else {
                    y = y + 1
                }
                while y >= 1 && x < row - 1 {
                    result.append(matrix[x][y])
                    x += 1
                    y -= 1
                }
                result.append(matrix[x][y])
            }
            upside = !upside
        }
        //append last
        result.append(matrix[row-1][col-1])
        return result
    }
}

let s = Solution()

//s.findDiagonalOrder([])
//s.findDiagonalOrder([[1,2,3],
//                     [4,5,6],
//                     [7,8,9]])

//s.findDiagonalOrder([[1,2,3,4],
//                     [5,6,7,8],
//                     [9,10,11,12]])


//s.findDiagonalOrder([[1]])

//s.findDiagonalOrder([[2,3]])

s.findDiagonalOrder([[3],[2]])

//s.findDiagonalOrder([[2,5],[8,4],[0,-1]])

//s.findDiagonalOrder([[1,2,3]])
//s.findDiagonalOrder([[1],
//                     [2],
//                     [3]])

