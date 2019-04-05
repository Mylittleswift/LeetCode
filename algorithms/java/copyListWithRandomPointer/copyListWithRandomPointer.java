

/*
A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.

Return a deep copy of the list.

https://leetcode.com/problems/copy-list-with-random-pointer/
*/


/**
 * Definition for singly-linked list with a random pointer.
 * class RandomListNode {
 *     int label;
 *     RandomListNode next, random;
 *     RandomListNode(int x) { this.label = x; }
 * };
 */
public class Solution {
	public RandomListNode copyRandomList(RandomListNode head) {
		if (head == null) {return head;}
		
		//copy normal node
		RandomListNode current = head;
		while (current != null) {
			RandomListNode node = new RandomListNode(current.label);
			node.next = current.next;
			current.next = node;
			current = node.next;//move two steps from current;
		}
		
		//copy random pointer
		current = head;//reset head
		while (current != null) {
			if (current.random != null) {
				current.next.random = current.random.next;//copy random pointer
			}
			current = current.next.next;//move two stops from current;
		}
		
		//seperate duplicate list
		current = head;
		RandomListNode copy = head.next;
		while (current != null) {
			RandomListNode temp = current.next;
			current.next = temp.next;
			if (temp.next != null) {
				temp.next = temp.next.next;
			}
			current = current.next;
		}
		return copy;
	}
}