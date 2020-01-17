//: [Previous](@previous)

/*
 347. Top K Frequent Elements
 Medium

 Given a non-empty array of integers, return the k most frequent elements.

 Example 1:

 Input: nums = [1,1,1,2,2,3], k = 2
 Output: [1,2]
 Example 2:

 Input: nums = [1], k = 1
 Output: [1]
 Note:

 You may assume k is always valid, 1 ≤ k ≤ number of unique elements.
 Your algorithm's time complexity must be better than O(n log n), where n is the array's size.
 
 */

import Foundation

class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var counter: [Int: Int] = [:]
        for i in 0..<nums.count {
            if counter[nums[i]] == nil {
                counter[nums[i]] = 0
            } else {
                counter[nums[i]]! += 1
            }
        }
        var keys: [(Int, Int) ] = []
        for key in counter.keys {
            keys.append((key, counter[key]!))
        }
        keys.sort(by: { $0.1 > $1.1 })
        return keys[0..<k].map { $0.0 }
    }
}

//: [Next](@next)
