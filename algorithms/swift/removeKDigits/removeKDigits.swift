/*
Given a non-negative integer num represented as a string, 
remove k digits from the number so that the new number is the smallest possible.

Note:
* The length of num is less than 10002 and will be ≥ k.
* The given num does not contain any leading zero.

Example 1:

Input: num = "1432219", k = 3
Output: "1219"
Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.

Example 2:

Input: num = "10200", k = 1
Output: "200"
Explanation: Remove the leading 1 and the number is 200. Note that the output must not contain leading zeroes.

Example 3:

Input: num = "10", k = 2
Output: "0"
Explanation: Remove all the digits from the number and it is left with nothing which is 0.
*/

func removeKdigits(_ num: String, _ k: Int) -> String {

    guard k > 0 else { return num }
    let num:[Character] = Array(num)
    let digits = num.count - k
    var stack = [Character]()
    var k = k
    var top = 0
    // k keeps track of how many characters we can remove
    // if the previous character in stack is larger than the current one
    // then removing it will get a smaller number
    // but we can only do so when k is larger than 0
    for i in 0..<num.count {
        let c = num[i]
        while top > 0 && stack[top-1] > c && k > 0 {
            top = top - 1
            k = k - 1
        }
        if stack.endIndex > top {
            stack[top] = c
        } else {
            stack.append(c)
        }
        top = top + 1
    }

    // find the index of first non-zero digi
    var index = 0
    while index < digits && stack[index] == "0" {
        index = index + 1
    }
    return index == digits ? "0" : String(stack[index..<digits])
}
