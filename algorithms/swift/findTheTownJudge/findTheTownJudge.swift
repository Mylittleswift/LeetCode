/*
 997. Find the Town Judge

 In a town, there are N people labelled from 1 to N.  There is a rumor that one of these people is secretly the town judge.

 If the town judge exists, then:

 The town judge trusts nobody.
 Everybody (except for the town judge) trusts the town judge.
 There is exactly one person that satisfies properties 1 and 2.
 You are given trust, an array of pairs trust[i] = [a, b] representing that the person labelled a trusts the person labelled b.

 If the town judge exists and can be identified, return the label of the town judge.  Otherwise, return -1.

 Example 1:

 Input: N = 2, trust = [[1,2]]
 Output: 2

 Example 2:

 Input: N = 3, trust = [[1,3],[2,3]]
 Output: 3

 Example 3:

 Input: N = 3, trust = [[1,3],[2,3],[3,1]]
 Output: -1

 Example 4:

 Input: N = 3, trust = [[1,2],[2,3]]
 Output: -1

 Example 5:

 Input: N = 4, trust = [[1,3],[1,4],[2,3],[2,4],[4,3]]
 Output: 3

 Note:

1. 1 <= N <= 1000
2. trust.length <= 10000
3. trust[i] are all different
4. trust[i][0] != trust[i][1]
5. 1 <= trust[i][0], trust[i][1] <= N

https://leetcode.com/problems/is-graph-bipartite/
 */
func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
    guard N > 0 else { return 0 }
    guard trust.count > 0, trust[0].count > 0 else { return 1 }

    // who trust me?
    var trustIn = Array(repeating: 0, count: N)
    // I trust who?
    var trustOut = Array(repeating: 0, count: N)

    for a in trust {
        guard let tin = a.first, let tout = a.last else { return -1 }
        trustIn[tout-1] += 1
        trustOut[tin-1] += 1
    }

    var judgeIndex = -1

    for i in 0..<trustIn.count {
        // When N-1 trust me, and I trust no one,
        // I am the Judge.
        if trustOut[i] == 0 && trustIn[i] == N - 1 {
            judgeIndex = i+1
        }
    }
    //if judgeIndex is -1, no Judge at all.
    //otherwise, return judgeIndex
    return judgeIndex
}
