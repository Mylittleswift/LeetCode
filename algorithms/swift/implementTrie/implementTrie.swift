/*
 Implement a trie with insert, search, and startsWith methods.

 Example:

 Trie trie = new Trie();

 trie.insert("apple");
 trie.search("apple");   // returns true
 trie.search("app");     // returns false
 trie.startsWith("app"); // returns true
 trie.insert("app");   
 trie.search("app");     // returns true


 Note:

* You may assume that all inputs are consist of lowercase letters a-z.
* All inputs are guaranteed to be non-empty strings.

*/

class Trie {

    class TrieNode<Key: Hashable> {
        var key: Key?
        weak var parent: TrieNode?
        var children: [Key: TrieNode] = [:]
        var isTerminating = false

        init(key: Key?, parent: TrieNode?) {
            self.key = key
            self.parent = parent
        }
    }

    typealias Node = TrieNode<Character>
    private let root = Node(key: nil, parent: nil)

    /** Initialize your data structure here. */
    init() {}

    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var current = root

        for c in word {
            if current.children[c] == nil {
                current.children[c] = Node(key: c, parent: current)
            }
            current = current.children[c]!
        }
        current.isTerminating = true
    }

    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var current = root
        for c in word {
            guard let child = current.children[c] else {
                return false
            }
            current = child
        }
        return current.isTerminating
    }

    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {

        var current = root
        for c in prefix {
            guard let child = current.children[c] else { return false }
            current = child
        }

        return true
    }
}


/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
