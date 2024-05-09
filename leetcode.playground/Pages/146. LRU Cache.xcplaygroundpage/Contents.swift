//: [Previous](@previous)

/*
 
 146. LRU Cache
 
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

/*
 
 ["LRUCache","put","put","get","put","get","get"]
 [[2],[2,1],[1,1],[2],[4,1],[1],[2]]
 
 ["LRUCache","put","put","get","put","get","put","get","get","get"]
 [[2],[1,1],[2,2],[1],[3,3],[2],[4,4],[1],[3],[4]]
 
 */


private class Node {
    let key: Int
    let value: Int
    var prev: Node?
    var next: Node?
    
    public init(key: Int, value: Int, prev: Node? = nil, next: Node? = nil) {
        self.key = key
        self.value = value
        self.prev = prev
        self.next = next
    }
}

class LRUCache {
   
    private let capacity: Int
    private var cache: [Int: Node]
    private let sentry = Node(key: 0, value: 0)
    private let tail = Node(key: 0, value: 0)
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.cache = [:]
        sentry.next = tail
        tail.prev = sentry
    }
    
    func get(_ key: Int) -> Int {
        guard let node = cache[key] else {
            return -1
        }
        if let prev = node.prev, let next = node.next {
            prev.next = next
            next.prev = prev
            tail.prev?.next = node
            node.prev = tail.prev
            node.next = tail
            tail.prev = node
        }
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if capacity <= 0 { return }
        let node = Node(key: key, value: value)
        let oldValue = get(key)
        if oldValue > 0 {
            tail.prev?.prev?.next = tail
            tail.prev = tail.prev?.prev
        }
        tail.prev?.next = node
        node.prev = tail.prev
        node.next = tail
        tail.prev = node

        cache[key] = node
        if cache.count > capacity, let delete = sentry.next {
            sentry.next = delete.next
            delete.next?.prev = sentry
            cache.removeValue(forKey: delete.key)
        }
    }
    
    private func printNode() {
        var output = [String]()
        var node: Node? = sentry
        while node != nil {
            output.append(String(node!.value))
            node = node?.next
        }
        print(output.joined(separator: "->"))
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

//: [Next](@next)
