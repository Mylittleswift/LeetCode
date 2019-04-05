/*
Given a singly linked list, determine if it is a palindrome.

https://leetcode.com/problems/palindrome-linked-list/
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
	public boolean isPalindrome(ListNode head) {
		if (head == null || head.next == null) return true;
		ListNode slow = head; 
		ListNode fast = head;
		while (fast.next != null && fast.next.next != null) {
			slow = slow.next;
			fast = fast.next.next;
		}
		
		ListNode last = slow.next;
		ListNode pre = head;
		while (last.next != null) {
			ListNode temp = last.next;
			last.next = temp.next;
			temp.next = slow.next;
			slow.next = temp;
		}
		
		while (slow.next != null) {
			slow = slow.next;
			if (pre.val != slow.val) return false;
			pre = pre.next;
		}
		return true;
	}
}