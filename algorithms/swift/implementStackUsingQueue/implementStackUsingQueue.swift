/*
 mplement the following operations of a stack using queues.

 push(x) -- Push element x onto stack.
 pop() -- Removes the element on top of the stack.
 top() -- Get the top element.
 empty() -- Return whether the stack is empty.

 https://leetcode.com/problems/implement-stack-using-queues
 */

class MyStack {
    private var stack:[Int]
    /** Initialize your data structure here. */
    init() {
        stack = [Int]()
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        stack.insert(x, at: 0)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        guard !stack.isEmpty else { fatalError() }
        return stack.removeFirst()
    }
    
    /** Get the top element. */
    func top() -> Int {
        guard !stack.isEmpty else { fatalError() }
        return stack.first!
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return stack.isEmpty
    }
}
