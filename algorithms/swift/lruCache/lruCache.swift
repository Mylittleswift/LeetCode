/*
 Design and implement a data structure for Least Recently Used (LRU) cache. It should support the following operations: get and put.

 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 put(key, value) - Set or insert the value if the key is not already present. When the cache reached its capacity, it should invalidate the least recently used item before inserting a new item.

 The cache is initialized with a positive capacity.

 Follow up:
 Could you do both operations in O(1) time complexity?

 Example:

 LRUCache cache = new LRUCache( 2 /* capacity */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // returns 1
 cache.put(3, 3);    // evicts key 2
 cache.get(2);       // returns -1 (not found)
 cache.put(4, 4);    // evicts key 1
 cache.get(1);       // returns -1 (not found)
 cache.get(3);       // returns 3
 cache.get(4);       // returns 4
 */

class LRUCache {

    final class Node<T> {
        var pre: Node?
        var next: Node?
        var val: T
        let key: T

        init(pre: Node?, next: Node?, key: T, val: T) {
            self.pre = pre
            self.next = next
            self.val = val
            self.key = key
        }
    }

    let capacity: Int
    var cache = [Int: Node<Int>]()
    var head: Node<Int> = Node(pre: nil, next: nil, key: 0, val: 0)
    var tail: Node<Int> = Node(pre: nil, next: nil, key: 0, val: 0)

    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.pre = head
    }

    func get(_ key: Int) -> Int {

        guard let node = cache[key] else { return -1 }
        //update position
        moveFirst(node)
        return node.val
    }

    func put(_ key: Int, _ value: Int) {

        if cache.keys.count == capacity && !cache.keys.contains(key) {
            remove(tail.pre!)
        }

        if let node = cache[key] {
            // update value
            node.val = value
            moveFirst(node)
        } else {
            let node = Node(pre: head, next: head.next, key: key, val: value)
            let hNext = head.next
            head.next = node
            hNext?.pre = node

            if tail.pre === head {
                tail.pre = node
                node.next = tail
            }

            cache[key] = node
        }

    }

    func moveFirst(_ node: Node<Int>) {
        // if node is head.next do nothing
        guard head.next !== node else { return }

        let pre = node.pre
        let next = node.next

        pre?.next = next
        next?.pre = pre

        node.next = head.next
        head.next?.pre = node
        head.next = node
        node.pre = head

    }

    func remove(_ node: Node<Int>) {

        let pre = node.pre
        let next = node.next

        pre?.next = next
        next?.pre = pre
        // update cache
        cache.removeValue(forKey: node.key)
    }
}
