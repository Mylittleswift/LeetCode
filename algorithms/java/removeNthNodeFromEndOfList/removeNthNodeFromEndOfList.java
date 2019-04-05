/*
Given a linked list, remove the n-th node from the end of list and return its head.


https://leetcode.com/submissions/detail/165137067/
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
	public ListNode removeNthFromEnd(ListNode head, int n) {
		ListNode start = new ListNode(0);
		ListNode slow = start, fast = start;
		slow.next = head;
		
		for (int i = 1; i <= n+1; i++) {
			fast = fast.next;
		}
		while (fast != null) {
			slow = slow.next;
			fast = fast.next;
		}
		slow.next = slow.next.next;
		return start.next;
	}
}