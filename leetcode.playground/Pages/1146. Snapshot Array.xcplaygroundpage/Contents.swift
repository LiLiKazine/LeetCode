//: [Previous](@previous)

/*
 1146. Snapshot Array
 中等
 Implement a SnapshotArray that supports the following interface:

 SnapshotArray(int length) initializes an array-like data structure with the given length. Initially, each element equals 0.
 void set(index, val) sets the element at the given index to be equal to val.
 int snap() takes a snapshot of the array and returns the snap_id: the total number of times we called snap() minus 1.
 int get(index, snap_id) returns the value at the given index, at the time we took the snapshot with the given snap_id
  

 Example 1:

 Input: ["SnapshotArray","set","snap","set","get"]
 [[3],[0,5],[],[0,6],[0,0]]
 Output: [null,null,0,null,5]
 Explanation:
 SnapshotArray snapshotArr = new SnapshotArray(3); // set the length to be 3
 snapshotArr.set(0,5);  // Set array[0] = 5
 snapshotArr.snap();  // Take a snapshot, return snap_id = 0
 snapshotArr.set(0,6);
 snapshotArr.get(0,0);  // Get the value of array[0] with snap_id = 0, return 5
  

 Constraints:

 1 <= length <= 5 * 104
 0 <= index < length
 0 <= val <= 109
 0 <= snap_id < (the total number of times we call snap())
 At most 5 * 104 calls will be made to set, snap, and get.
 
 */

import Foundation

class SnapshotArray {
    
    var cache: [[(Int, Int)]]
    
    var snap_id = 0
    
    init(_ length: Int) {
        cache = Array(repeating: [], count: length)
    }
    
    func set(_ index: Int, _ val: Int) {
        if cache[index].count == snap_id + 1 {
            cache[index][snap_id] = (snap_id, val)
        } else {
            cache[index].append((snap_id, val))
        }
    }
    
    func snap() -> Int {
        snap_id += 1
        return snap_id - 1
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        let snapshot = cache[index]
        var l = 0, r = snapshot.count - 1
        while l <= r {
            let mid = l + (r - l) / 2
            if snapshot[mid].0 > snap_id {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return r == -1 ? 0 : snapshot[r].1
    }
}

/**
 * Your SnapshotArray object will be instantiated and called as such:
 * let obj = SnapshotArray(length)
 * obj.set(index, val)
 * let ret_2: Int = obj.snap()
 * let ret_3: Int = obj.get(index, snap_id)
 */

//: [Next](@next)
