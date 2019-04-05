/*
You are given a doubly linked list which in addition to the next and previous pointers, it could have a child pointer, which may or may not point to a separate doubly linked list. These child lists may have one or more children of their own, and so on, to produce a multilevel data structure, as shown in the example below.

Flatten the list so that all the nodes appear in a single-level, doubly linked list. You are given the head of the first level of the list.

https://leetcode.com/problems/flatten-a-multilevel-doubly-linked-list/
*/


/*
// Definition for a Node.
class Node {
	public int val;
	public Node prev;
	public Node next;
	public Node child;

	public Node() {}

	public Node(int _val,Node _prev,Node _next,Node _child) {
		val = _val;
		prev = _prev;
		next = _next;
		child = _child;
	}
};
*/
class Solution {
	public Node flatten(Node head) {
		if (head == null) {return null;}
		Node current = head;
		while (current != null) {
			if (current.child != null) {
				//get child tail
				Node childTail = current.child;
				while (childTail.next != null) {
					childTail = childTail.next;
				}
				Node temp = current.next;
				current.next = current.child;
				current.child.prev = current;
				current.child = null;
				childTail.next = temp;
				if (temp != null) temp.prev = childTail;
				
			}
			current = current.next;
		}        
		
		return head;
	}
}