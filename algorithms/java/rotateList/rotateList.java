/*
Given a linked list, rotate the list to the right by k places, where k is non-negative.

https://leetcode.com/problems/rotate-list/
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
	public ListNode rotateRight(ListNode head, int k) {
		if (head == null || k <= 0) return head;
		
		int length = 1;
		ListNode curr = head;
		while (curr.next != null) {
			curr = curr.next;
			length += 1;
		}
		
		//connect tail to head
		curr.next = head;
	   
		//find the left place
		int p = length - k % length;
		
		//find the palce
		for (int i = 0; i < p; i++) {
			curr = curr.next;
		}
		
		//break the list
		head = curr.next;
		curr.next = null;
		
		return head;
	}
}