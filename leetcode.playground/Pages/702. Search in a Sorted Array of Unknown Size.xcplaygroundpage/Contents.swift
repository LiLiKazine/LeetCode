//: [Previous](@previous)

/*
 702. Search in a Sorted Array of Unknown Size
 中等
 This is an interactive problem.

 You have a sorted array of unique elements and an unknown size. You do not have an access to the array but you can use the ArrayReader interface to access it. You can call ArrayReader.get(i) that:

 returns the value at the ith index (0-indexed) of the secret array (i.e., secret[i]), or
 returns 231 - 1 if the i is out of the boundary of the array.
 You are also given an integer target.

 Return the index k of the hidden array where secret[k] == target or return -1 otherwise.

 You must write an algorithm with O(log n) runtime complexity.

  

 Example 1:

 Input: secret = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in secret and its index is 4.
 Example 2:

 Input: secret = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in secret so return -1.
  

 Constraints:

 1 <= secret.length <= 104
 -104 <= secret[i], target <= 104
 secret is sorted in a strictly increasing order.
 
 */

import Foundation


public class ArrayReader {
    public func get(_ index: Int) -> Int { 0 }
}
 

class Solution {
    func search(_ reader: ArrayReader, _ target: Int) -> Int {
        if reader.get(0) > target { return -1 }
        var l = 0, r = 1
        while reader.get(r) < target {
            l = r
            r *= 2
        }
        while l <= r {
            let mid = l + (r - l) / 2
            if reader.get(mid) < target {
                l = mid + 1
            } else {
                r = mid - 1
            }
        }
        return reader.get(l) == target ? l : -1
    }
}

//: [Next](@next)
