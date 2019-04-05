/*
Remove all elements from a linked list of integers that have value val.

https://leetcode.com/problems/remove-linked-list-elements/
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
	public static ListNode removeElements(ListNode head, int val) {
		ListNode dummy = new ListNode(0);
		dummy.next = head;
		for (ListNode node = dummy; node.next != null;) {
			if (node.next.val == val) {
				node.next = node.next.next;
			} else {
				node = node.next;
			}
		}
		return dummy.next;
	}
}