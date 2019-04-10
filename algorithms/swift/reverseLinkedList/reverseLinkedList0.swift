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

        // find tail
        var tail = head
        while (tail?.next != nil) {
            tail = tail?.next
        }

        // make a cycle
        tail?.next = head

        while (head?.next !== tail) {

            let h_next = head?.next
            let t_next = tail?.next

            tail?.next = h_next
            head?.next = h_next?.next
            h_next?.next = t_next

        }

        // break cycle
        head?.next = nil

        return tail
    }
}
