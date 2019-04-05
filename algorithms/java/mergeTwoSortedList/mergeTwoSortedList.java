/*
Merge two sorted linked lists and return it as a new list. The new list should be made by splicing together the nodes of the first two lists.

https://leetcode.com/problems/merge-two-sorted-lists/
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
	public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
		if (l1 == null) return l2;
		if (l2 == null) return l1;
		ListNode head = new ListNode(0);
		ListNode current = head;
		
		while(l1 != null && l2 != null) {
			if (l1.val > l2.val) {
				current.next = l2;
				l2 = l2.next;
			} else {
				current.next = l1;
				l1 = l1.next;
			}
			current = current.next;
		}
		if (l1 != null) {
			current.next = l1;
		}else if (l2 != null) {
			current.next = l2;
		}
		return head.next;
	}
}