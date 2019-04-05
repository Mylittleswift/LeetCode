/*
Reverse a singly linked list.

https://leetcode.com/problems/reverse-linked-list/
*/


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
	public ListNode reverseList(ListNode head) {
		if (head == null) {
			return head;
		}
		ListNode currentHead = head;
		while (head.next != null) {
			ListNode p = head.next;
			head.next = p.next;
			p.next = currentHead;
			currentHead = p;
		}
		return currentHead;
	}
}
