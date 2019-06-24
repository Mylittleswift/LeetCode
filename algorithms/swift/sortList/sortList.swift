/*
 148. Sort List

 Sort a linked list in O(n log n) time using constant space complexity.

 Example 1:

 Input: 4->2->1->3
 Output: 1->2->3->4

 Example 2:

 Input: -1->5->3->4->0
 Output: -1->0->3->4->5

 */

    func sortList(_ head: ListNode?) -> ListNode? {

        guard let h = head, let next = h.next else { return head }

        //find middle
        var slow: ListNode? = h
        var fast: ListNode? = h
        var pre: ListNode? = h

        while fast?.next != nil && fast?.next != nil {
            pre = slow
            slow = slow?.next
            fast = fast?.next?.next
        }

        pre?.next = nil
        // divide
        let l0 = sortList(head)
        let l1 = sortList(slow)
        // merge
        return merge(l0, l1)
    }

    func merge(_ l0: ListNode?, _ l1: ListNode?) -> ListNode? {

        if l0 == nil { return l1 }
        else if l1 == nil { return l0 }

        var dummy:ListNode = ListNode(0)
        var current:ListNode? = dummy
        var l0 = l0
        var l1 = l1

        while l0 != nil && l1 != nil {
            if l0!.val <= l1!.val {
                current?.next = l0
                l0 = l0?.next
            } else {
                current?.next = l1
                l1 = l1?.next
            }
            current = current?.next
        }

        if l0 == nil {
            current?.next = l1
        } else if l1 == nil {
            current?.next = l0
        }

        return dummy.next
    }
