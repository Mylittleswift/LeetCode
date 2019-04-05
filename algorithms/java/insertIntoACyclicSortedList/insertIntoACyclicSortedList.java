/*
Given a node from a cyclic linked list which is sorted in ascending order, write a function to insert a value into the list such that it remains a cyclic sorted list. The given node can be a reference to any single node in the list, and may not be necessarily the smallest value in the cyclic list.

If there are multiple suitable places for insertion, you may choose any place to insert the new value. After the insertion, the cyclic list should remain sorted.

If the list is empty (i.e., given node is null), you should create a new single cyclic list and return the reference to that single node. Otherwise, you should return the original given node.

https://leetcode.com/problems/insert-into-a-cyclic-sorted-list/
*/

/*
// Definition for a Node.
class Node {
	public int val;
	public Node next;

	public Node() {}

	public Node(int _val,Node _next) {
		val = _val;
		next = _next;
	}
};
*/
class Solution {
	public Node insert(Node head, int val) {
		if(head == null) {
			Node dummy = new Node(val, null);
			dummy.next = dummy;
			return dummy;
		}
		
		if(head.next == head) {
			head.next = new Node(val, head);
			return head;
		}
		
		Node curr = head;
		Node next = head.next;
		
		while(curr.next != head) {
			if (((curr.val > next.val) && (val > curr.val || val < next.val)) // New Max || New Min
				|| (curr.val <= val && val <= next.val)) { // Normal Situation
				curr.next = new Node(val, next); 
				return head;
			}
			curr = curr.next;
			next = curr.next;
		}
		
		curr.next = new Node(val, next);
		return head;
	}
}