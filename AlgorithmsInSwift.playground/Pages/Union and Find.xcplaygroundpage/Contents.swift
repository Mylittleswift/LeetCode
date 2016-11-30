//: Playground - noun: a place where people can play


//:Quick-find
public struct QuickFindUF {
    private var id = [Int]()
    
    init(capacity: Int) {
        for i in 0..<capacity {
           id.append(i)
        }
    }
    
    public func connected(_ first: Int, _ second: Int) -> Bool {
        return id[first] == id[second]
    }
    
    public mutating func union(_ first: Int, _ second: Int) {
        let pid: Int = id[first]
        let qid: Int = id[second]
        for i in 0..<id.count {
            if id[i] == pid {
                id[i] = qid;
            }
        }
    }
}


//test cases
var qfUF = QuickFindUF(capacity: 10)
assert(qfUF.connected(1,2) == false)
qfUF.union(2, 7)
qfUF.union(7, 8)
qfUF.union(8, 9)
assert(qfUF.connected(2, 9) == true)
qfUF.union(0, 5)
qfUF.union(5, 6)
assert(qfUF.connected(0, 6) == true)
qfUF.union(3, 4)
assert(qfUF.connected(3, 4) == true)
assert(qfUF.connected(0, 3) == false)
assert(qfUF.connected(2, 3) == false)




//:Quick-union
public struct QuickUnionUF {
    private var id = [Int]()
    
    init(capacity: Int) {
        for i in 0..<capacity {
            id.append(i)
        }
    }
    
    private func root(_ num: Int) -> Int {
        var root = num
        while (root != id[root]) {
            root = id[root]
        }
        return root
    }
    
    public func connected(_ first: Int, _ second: Int) -> Bool {
        return root(first) == root(second)
    }
    
    public mutating func union(_ first: Int, _ second: Int) {
        let i:Int = root(first)
        let j:Int = root(second)
        id[i] = j
    }
}

//test cases
var quUF = QuickUnionUF(capacity: 10)
assert(quUF.connected(1,2) == false)
quUF.union(2, 7)
quUF.union(7, 8)
quUF.union(8, 9)
assert(quUF.connected(2, 9) == true)
quUF.union(0, 5)
quUF.union(5, 6)
assert(quUF.connected(0, 6) == true)
quUF.union(3, 4)
assert(quUF.connected(3, 4) == true)
assert(quUF.connected(0, 3) == false)
assert(quUF.connected(2, 3) == false)

//:weighted quick-union
public struct WeightedQuickUnionUF {
    private var id = [Int]()
    private var size: [Int] //size of component for roots
    
    init(capacity: Int) {
        for i in 0..<capacity {
            id.append(i)
        }
        
        size = [Int](repeatElement(1, count: capacity))
    }
    
    private mutating func root(_ num: Int) -> Int {
        var root = num
        while (root != id[root]) {
            id[root] = id[id[root]] //path compression
            root = id[root]
        }
        return root
    }
    
    public mutating func connected(_ first: Int, _ second: Int) -> Bool {
        return root(first) == root(second)
    }
    
    public mutating func union(_ first: Int, _ second: Int) {
        let i:Int = root(first)
        let j:Int = root(second)
        if i == j {
            return
        }
        
        if size[i] < size[j] {
            id[i] = j;
            size[j] += size[i]
        } else {
            id[j] = i
            size[i] += size[j]
        }
    }
}



//test cases
var wquUF = WeightedQuickUnionUF(capacity: 10)
assert(wquUF.connected(1,2) == false)
wquUF.union(2, 7)
wquUF.union(7, 8)
wquUF.union(8, 9)
assert(wquUF.connected(2, 9) == true)
wquUF.union(0, 5)
wquUF.union(5, 6)
assert(wquUF.connected(0, 6) == true)
wquUF.union(3, 4)
assert(wquUF.connected(3, 4) == true)
assert(wquUF.connected(0, 3) == false)
assert(wquUF.connected(2, 3) == false)











