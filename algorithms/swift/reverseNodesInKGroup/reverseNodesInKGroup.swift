/*
 Given a linked list, reverse the nodes of a linked list k at a time and return its modified list.

 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes in the end should remain as it is.

 https://leetcode.com/problems/reverse-nodes-in-k-group/
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard let _ = head else { return head }
    guard k > 1 else { return head }

    var head = head
    var current = head
    var prev: ListNode?

    // traverse list
    while current?.next != nil {
        let (first, last) = divide(head: current, length: k)
        current = last?.next
        // there are k nodes

        guard let _ = last else { return head }

        let (r_first, r_last) = reverse(head: first, tail: last)

        // reset head
        if r_last === head {
            head = r_first
            prev = nil
        }

        prev?.next = r_first
        r_last?.next = current

        prev = r_last
    }
    return head
}

func divide(head: ListNode?, length: Int) -> (ListNode?, ListNode?) {
    let first = head
    var last = head
    for _ in 1...length-1 {
        let temp = last?.next
        last = temp
        if temp == nil { break }
    }
    return (first, last)
}

func reverse(head: ListNode?, tail: ListNode?) -> (ListNode?, ListNode?) {
    var prev: ListNode?
    let tailNext = tail?.next
    var current = head
    var next: ListNode?
    while current !== tailNext {
        next = current?.next
        current?.next = prev
        prev = current
        current = next
    }
    return (prev, head)
}
