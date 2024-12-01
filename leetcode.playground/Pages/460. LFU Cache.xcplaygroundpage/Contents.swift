//: [Previous](@previous)

/*
 
 460. LFU Cache
 
 Design and implement a data structure for Least Frequently Used (LFU) cache. It should support the following operations: get and put.

 get(key) - Get the value (will always be positive) of the key if the key exists in the cache, otherwise return -1.
 put(key, value) - Set or insert the value if the key is not already present. When the cache reaches its capacity, it should invalidate the least frequently used item before inserting a new item. For the purpose of this problem, when there is a tie (i.e., two or more keys that have the same frequency), the least recently used key would be evicted.

 Note that the number of times an item is used is the number of calls to the get and put functions for that item since it was inserted. This number is set to zero when the item is removed.

  

 Follow up:
 Could you do both operations in O(1) time complexity?

  

 Example:

 LFUCache cache = new LFUCache( 2 /* capacity */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // returns 1
 cache.put(3, 3);    // evicts key 2
 cache.get(2);       // returns -1 (not found)
 cache.get(3);       // returns 3.
 cache.put(4, 4);    // evicts key 1.
 cache.get(1);       // returns -1 (not found)
 cache.get(3);       // returns 3
 cache.get(4);       // returns 4
 
 */

import Foundation

class LFUCache {
    
    class ListNode : CustomStringConvertible {
        let key: Int
        var value: Int
        var freq: Int
        var next: ListNode?
        var prev: ListNode?
        init(key: Int, value: Int, freq: Int = 1, next: ListNode? = nil, prev: ListNode? = nil) {
            self.key = key
            self.value = value
            self.freq = freq
            self.next = next
            self.prev = prev
        }
        
        var description: String {
            "key: \(key), value: \(value), freq: \(freq)"
        }
    }
    
    let capacity: Int
    
    var sentryList = [ListNode(key: 0, value: 0)]
    
    var cache: [Int: ListNode] = [:]

    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = cache[key] else {
            // print("get \(key)", -1)
            return -1
        }
        read(node)
        // print("get \(key)", cache)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = cache[key] {
            node.value = value
            read(node)
        } else {
            let node = ListNode(key: key, value: value)
            if cache.count == capacity {
                remove()
            }
            insert(node)
        }
        // print("put \(key):\(value)", cache)
    }
    
    func remove() {
        // print("remove", sentryList.map(\.next))
        for i in 1..<sentryList.count {
            let sentry = sentryList[i]
            guard let tail = sentry.prev, tail !== sentry else {
                continue
            }
            tail.prev?.next = tail.next
            tail.next?.prev = tail.prev
            cache.removeValue(forKey: tail.key)
//            var cur = sentry
//            while cur.next != nil {
//                cur = cur.next!
//            }
//            guard cur !== sentry else {
//                continue
//            }
//            cur.prev?.next = nil
//            cache.removeValue(forKey: cur.key)
            break
        }
    }
    
    func read(_ node: ListNode) {
        node.freq += 1
        node.prev?.next = node.next
        node.next?.prev = node.prev
        insert(node)
    }
    
    func insert(_ node: ListNode) {
        if sentryList.count <= node.freq {
            let sentry = ListNode(key: 0, value: 0)
            sentry.prev = sentry
            sentry.next = sentry
            sentryList.append(sentry)
        }
        let sentry = sentryList[node.freq]
        let nxt = sentry.next
        sentry.next = node
        node.prev = sentry
        node.next = nxt
        nxt?.prev = node
        cache[node.key] = node
    }
}

/**
 * Your LFUCache object will be instantiated and called as such:
 * let obj = LFUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

//: [Next](@next)
