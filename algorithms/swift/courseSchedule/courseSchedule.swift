/*
 207. Course Schedule

 There are a total of n courses you have to take, labeled from 0 to n-1.

 Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]

 Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?

 Example 1:

 Input: 2, [[1,0]] 
 Output: true
 Explanation: There are a total of 2 courses to take. 
 To take course 1 you should have finished course 0. So it is possible.

 Example 2:

 Input: 2, [[1,0],[0,1]]
 Output: false
 Explanation: There are a total of 2 courses to take. 
 To take course 1 you should have finished course 0, and to take course 0 you should
 also have finished course 1. So it is impossible.

 Note:

 1.The input prerequisites is a graph represented by a list of edges, not adjacency matrices. Read more about how a graph is represented.
 2.You may assume that there are no duplicate edges in the input prerequisites.


 */

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var queue = [Int]()
    var inDegree = Array(repeating: 0, count: numCourses)
    var graph = Array(repeating: [Int](), count: numCourses)


    // init inDegree and graph
    for i in 0..<prerequisites.count {
        let from = prerequisites[i][0]
        let to = prerequisites[i][1]

        inDegree[to] = inDegree[to] + 1

        var adj = graph[from]
        adj.append(to)
        graph[from] = adj
    }

    // add indegree 0 into queue
    for i in 0..<numCourses {
        if inDegree[i] == 0 {
            queue.append(i)
        }
    }

    while !queue.isEmpty {
        let c = queue.removeFirst()
        for x in graph[c] {
            inDegree[x] = inDegree[x] - 1
            if inDegree[x] == 0 {
                queue.append(x)
            }
        }
    }

    for i in 0..<numCourses {
        if inDegree[i] > 0 {
            return false
        }
    }
    return true
}
