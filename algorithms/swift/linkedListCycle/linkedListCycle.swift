public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func hasCycle(_ head: ListNode?) -> Bool {

    guard let _ = head else { return false }

    var slow = head
    var fast = head

    while (fast?.next != nil && fast?.next?.next != nil) {
        slow = slow?.next
        fast = fast?.next?.next

        if (slow === fast) { return true }
    }
    return false
}
