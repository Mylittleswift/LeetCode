/*
Given a linked list, return the node where the cycle begins. If there is no cycle, return null.

To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.

Note: Do not modify the linked list.

https://leetcode.com/problems/linked-list-cycle-ii/
*/

/**
 * Definition for singly-linked list.
 * class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) {
 *         val = x;
 *         next = null;
 *     }
 * }
 */
public class Solution {
	public ListNode detectCycle(ListNode head) {
		if(head == null || head.next == null) return null;

		ListNode slow = head;
		ListNode fast = head;

		while(fast != null && fast.next != null){
			slow = slow.next;
			fast = fast.next.next;

			if(slow == fast) break;
		}
		if(fast == null || fast.next == null) return null;

		slow = head;
		while(slow != fast){
			slow = slow.next;
			fast = fast.next;
		}
		return slow;
	}
}