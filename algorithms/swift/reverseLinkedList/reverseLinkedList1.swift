/*
 Reverse a singly linked list.

 https://leetcode.com/problems/reverse-linked-list/
 */

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
class Solution {

    func reverseList(_ head: ListNode?) -> ListNode? {
        var first: ListNode?
        var current = head
        var temp: ListNode?

        while current != nil {
            temp = current?.next
            current?.next = first
            first = current
            current = temp
        }
        return first
    }
}
