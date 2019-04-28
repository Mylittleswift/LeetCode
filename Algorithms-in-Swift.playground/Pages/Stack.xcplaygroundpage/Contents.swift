import Foundation

example(of: "using a stack") {
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)

    print(stack)
    
    if let popedElement = stack.pop() {
        assert( 4 == popedElement)
        print("Popped: \(popedElement)")
    }
}


example(of: "initializing a stack from an array") {
    let array = ["A", "B", "C", "D"]
    var stack = Stack(array)
    print(stack)
    stack.pop()
}


example(of: "initializing a stack from an array literal") {
    var stack: Stack = [1.0, 2.0, 3.0, 4.0]
    print(stack)
    stack.pop()
}


func printInReverse<T>(_ list: LinkedList<T>) {
    var current = list.head
    var stack = Stack<T>()
    
    while let node = current {
        stack.push(node.value)
        current = node.next
    }
    
    while let value = stack.pop() {
        print(value)
    }
}

example(of: "Challenges 1") {
    let list: LinkedList<Int> = {
        var list = LinkedList<Int>()
        list.push(3)
        list.push(2)
        list.push(1)
        return list
    }()
    
    printInReverse(list)
}

var testString1 = "h((e))llo(world)()"
//var testString2 = "(hello world"

func checkParentheses(_ string: String) -> Bool {
    var stack = Stack<Character>()
    
    for character in string {
        if character == "(" {
            stack.push(character)
        } else if character == ")" {
            if stack.isEmpty() {
                return false
            } else {
                stack.pop()
            }
        }
    }
    return stack.isEmpty()
}

checkParentheses(testString1) // should be true
//checkParentheses(testString2) // should be false


var queue = [TreeNode]()


func levelOrder(_ root: TreeNode?) -> [[Int]] {
    
    guard let root = root else { return [[]] }
    
    var result = [[Int]]()
    var temp = [Int?]()
    queue.append = root
    
    temp.append(root.val)
    
    while !queue.isEmpty {
        let node = queue.removeFrist()
        
        if let left = node.left {
            queue.append(left)
        }
        
        if let right = node.right {
            queue.append(right)
        }
        
        temp.append(node.left)
        temp.append(node.right)
        
    }
    
    return result
}

