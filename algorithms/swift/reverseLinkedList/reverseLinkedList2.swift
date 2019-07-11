func reverseList(_ head: ListNode?) -> ListNode? {
    guard let h = head, let _ = h.next else { return head }
    let dummy = ListNode(0)
    dummy.next = head

    var n: ListNode? = head?.next
    var p: ListNode? = head

    while n != nil {
        let h = dummy.next
        p?.next = n?.next
        dummy.next = n
        n?.next = h

        n = p?.next
    }
    return dummy.next
}
