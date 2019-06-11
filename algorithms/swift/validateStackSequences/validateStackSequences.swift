/*
 Given two sequences pushed and popped with distinct values, return true if and only if this could have been the result of a sequence of push and pop operations on an initially empty stack.

 Example 1:

 Input: pushed = [1,2,3,4,5], popped = [4,5,3,2,1]
 Output: true
 Explanation: We might do the following sequence:
 push(1), push(2), push(3), push(4), pop() -> 4,
 push(5), pop() -> 5, pop() -> 3, pop() -> 2, pop() -> 1

 Example 2:

 Input: pushed = [1,2,3,4,5], popped = [4,3,5,1,2]
 Output: false
 Explanation: 1 cannot be popped before 2.

 Note:

  1. 0 <= pushed.length == popped.length <= 1000
  2. 0 <= pushed[i], popped[i] < 1000
  3.pushed is a permutation of popped.
  4.pushed and popped have distinct values.
  */
func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {

    guard pushed.count > 0, popped.count > 0 else { return true }
    guard pushed != popped else { return true }
    guard pushed.count == popped.count else { return false }

    var stack = [Int]()
    var popped = popped
    var pushed = pushed

    // init stack
    while let push = pushed.first,
        let pop = popped.first,
        push != pop {
            // push to stack
            stack.append(pushed.removeFirst())
    }

    while !pushed.isEmpty {
        if let toPush = pushed.first, let toPop = popped.first {
            if toPop == toPush {
                pushed.removeFirst()
                popped.removeFirst()
            } else if let top = stack.last, top == toPop {
                //pop
                stack.removeLast()
                popped.removeFirst()
            } else {
                stack.append(toPush)
                pushed.removeFirst()
            }
        }
    }

    while !popped.isEmpty {
        let toPop = popped.removeFirst()
        let top = stack.removeLast()

        if toPop != top {
            return false
        }
    }

    return true
}
