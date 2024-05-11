//: [Previous](@previous)

/*
 373. Find K Pairs with Smallest Sums
 中等
 You are given two integer arrays nums1 and nums2 sorted in non-decreasing order and an integer k.

 Define a pair (u, v) which consists of one element from the first array and one element from the second array.

 Return the k pairs (u1, v1), (u2, v2), ..., (uk, vk) with the smallest sums.

  

 Example 1:

 Input: nums1 = [1,7,11], nums2 = [2,4,6], k = 3
 Output: [[1,2],[1,4],[1,6]]
 Explanation: The first 3 pairs are returned from the sequence: [1,2],[1,4],[1,6],[7,2],[7,4],[11,2],[7,6],[11,4],[11,6]
 Example 2:

 Input: nums1 = [1,1,2], nums2 = [1,2,3], k = 2
 Output: [[1,1],[1,1]]
 Explanation: The first 2 pairs are returned from the sequence: [1,1],[1,1],[1,2],[2,1],[1,2],[2,2],[1,3],[1,3],[2,3]
  

 Constraints:

 1 <= nums1.length, nums2.length <= 105
 -109 <= nums1[i], nums2[i] <= 109
 nums1 and nums2 both are sorted in non-decreasing order.
 1 <= k <= 104
 k <= nums1.length * nums2.length
 
 */

import Foundation

class Solution {
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        
        var heap = Heap<[Int]> { e1, e2 in
            return nums1[e1[0]] + nums2[e1[1]] <= nums1[e2[0]] + nums2[e2[1]]
        }
        
        let len1 = nums1.count, len2 = nums2.count
        for i in 0..<min(len1, k) {
            heap.enqueue([i, 0])
        }
        var k = k
        var ans = [[Int]]()
        while k > 0, let top = heap.dequeue() {
            k -= 1
            ans.append([nums1[top[0]], nums2[top[1]]])
            if top[1] + 1 < len2 {
                heap.enqueue([top[0], top[1] + 1])
            }
        }
        return ans
    }
}

//: [Next](@next)
