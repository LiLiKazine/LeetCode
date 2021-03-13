//: [Previous](@previous)

/*
 
 705. Design HashSet
 
 Design a HashSet without using any built-in hash table libraries.

 Implement MyHashSet class:

 void add(key) Inserts the value key into the HashSet.
 bool contains(key) Returns whether the value key exists in the HashSet or not.
 void remove(key) Removes the value key in the HashSet. If key does not exist in the HashSet, do nothing.
  

 Example 1:

 Input
 ["MyHashSet", "add", "add", "contains", "contains", "add", "contains", "remove", "contains"]
 [[], [1], [2], [1], [3], [2], [2], [2], [2]]
 Output
 [null, null, null, true, false, null, true, null, false]

 Explanation
 MyHashSet myHashSet = new MyHashSet();
 myHashSet.add(1);      // set = [1]
 myHashSet.add(2);      // set = [1, 2]
 myHashSet.contains(1); // return True
 myHashSet.contains(3); // return False, (not found)
 myHashSet.add(2);      // set = [1, 2]
 myHashSet.contains(2); // return True
 myHashSet.remove(2);   // set = [1]
 myHashSet.contains(2); // return False, (already removed)
  

 Constraints:

 0 <= key <= 106
 At most 104 calls will be made to add, remove, and contains.
  

 Follow up: Could you solve the problem without using the built-in HashSet library?
 
 */

class MyHashSet {

    private var set: [Int]
    
    /** Initialize your data structure here. */
    init() {
        set = []
    }
    
    func add(_ key: Int) {
        if key < set.count {
            set[key] = 1
        } else {
            var newSet = set + Array(repeating: 0, count: key - set.count + 1)
            newSet[key] = 1
            set = newSet
        }
    }
    
    func remove(_ key: Int) {
        if key < set.count {
            set[key] = 0
        }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        if key < set.count {
            return set[key] == 1
        } else {
            return false
        }
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */

//: [Next](@next)
