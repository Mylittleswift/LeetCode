/*
 92. Reverse Linked List II

 Reverse a linked list from position m to n. Do it in one-pass.

 Note: 1 ≤ m ≤ n ≤ length of list.

 Example:

 Input: 1->2->3->4->5->NULL, m = 2, n = 4
 Output: 1->4->3->2->5->NULL

 https://leetcode.com/problems/reverse-linked-list-ii/
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
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        guard let _ = head else {
            return head
        }

        let dummy = ListNode(0)
        dummy.next = head

        // make a pointer `pre` as a marker for the node before reversing
        var pre: ListNode? = dummy
        for _ in 0..<(m - 1) {
            pre = pre?.next
        }

        // a pointer to the beginning of a sub-list that will be reversed
        let start: ListNode? = pre?.next
        // a pointer to a node that will be reversed
        var then: ListNode? = start?.next

        // 1->2->3->4->5 m=2, n=4, pre=1, start=2, then=3
        // dummy->1->2->3->4->5


        // first: dummy->1->3->2->4->5, pre=1, start=2, then=4
        // second: dummy->1->4->3->2->5, pre=1, start=2, then=5(done)
        for _ in 0..<(n - m) {
            start?.next = then?.next
            then?.next = pre?.next
            pre?.next = then
            then = start?.next
        }

        return dummy.next
    }
}
