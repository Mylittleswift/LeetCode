import Foundation

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        guard matrix.count > 0 else {
            return []
        }
        guard matrix[0].count > 0 else {
            return []
        }
        
        let col = matrix[0].count
        let row = matrix.count
        
        var upperLeft = (1,0)
        var upperRight = (0, col-1)
        var lowerLeft = (row-1, 0)
        var lowerRight = (row-1, col-1)
        
        var step = 0
        let total = col * row
        var spiral = [Int]()
        
        func checkFinish() -> Bool {
            return step >= total
        }
        
        while true {
            //right
            for i in upperLeft.1 ..< upperRight.1 + 1 {
                spiral.append(matrix[upperRight.0][i])
                step += 1
            }
            if checkFinish() { break }
            
            //down
            for i in upperRight.0+1 ..< lowerRight.0 + 1{
                spiral.append(matrix[i][lowerRight.1])
                step += 1
            }
            if checkFinish() { break }

            //left
            for i in stride(from: lowerRight.1 - 1, to: lowerLeft.1-1, by: -1) {
                spiral.append(matrix[lowerRight.0][i])
                step += 1
            }

            if checkFinish() { break }

            //up
            for i in stride(from: lowerLeft.0-1, to: upperLeft.0-1, by: -1) {
                spiral.append(matrix[i][lowerLeft.1])
                step += 1
            }

            if checkFinish() { break }
            
            upperLeft = (upperLeft.0 + 1, upperLeft.1 + 1)
            upperRight = (upperRight.0 + 1, upperRight.1 - 1)
            lowerLeft = (lowerLeft.0 - 1, lowerLeft.1 + 1)
            lowerRight = (lowerRight.0 - 1, lowerRight.1 - 1)
        }
        
        return spiral
    }
}


let s = Solution()

assert(s.spiralOrder([]) == [])

assert(s.spiralOrder([[1,2,3],
                      [4,5,6],
                      [7,8,9]]) == [1,2,3,6,9,8,7,4,5])

assert(s.spiralOrder([[1,2,3,4],
                      [5,6,7,8],
                      [9,10,11,12]]) == [1,2,3,4,8,12,11,10,9,5,6,7])

