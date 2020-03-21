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

class LRUCache {
    private var cache: [Int: (v: Int, u: Int)]
    private let capacity: Int
    
    init(_ capacity: Int) {
        self.capacity = capacity
        cache = [:]
    }
    
    func get(_ key: Int) -> Int {
        
        for k in cache.keys {
            if k == key {
                cache[k]?.u = 0
            }
            cache[k]?.u -= 1
        }
        return cache[key]?.v ?? -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if capacity <= cache.count  {
            var key = -1, t = 1
            for k in cache.keys {
                if cache[k]!.u < t {
                    t = cache[k]!.u
                    key = k
                }
            }
            cache.removeValue(forKey: key)
        }
        cache[key] = (value, 0)
        for k in cache.keys {
            if k == key {
                continue
            }
            cache[k]?.u -= 1
        }
    }
}

/**
 * Your LRUCache object will be instantiated and called as such:
 * let obj = LRUCache(capacity)
 * let ret_1: Int = obj.get(key)
 * obj.put(key, value)
 */

//: [Next](@next)
