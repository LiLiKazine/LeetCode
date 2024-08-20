//: [Previous](@previous)

/*
 面试题 17.18. Shortest Supersequence LCCI
 中等
 You are given two arrays, one shorter (with all distinct elements) and one longer. Find the shortest subarray in the longer array that contains all the elements in the shorter array. The items can appear in any order.

 Return the indexes of the leftmost and the rightmost elements of the array. If there are more than one answer, return the one that has the smallest left index. If there is no answer, return an empty array.

 Example 1:

 Input:
 big = [7,5,9,0,2,1,3,5,7,9,1,1,5,8,8,9,7]
 small = [1,5,9]
 Output: [7,10]
 Example 2:

 Input:
 big = [1,2,3]
 small = [4]
 Output: []
 Note:

 big.length <= 100000
 1 <= small.length <= 100000
 
 */

import Foundation

class Solution {
    func shortestSeq(_ big: [Int], _ small: [Int]) -> [Int] {
        var ans = [Int]()
        var dict = Dictionary(uniqueKeysWithValues: small.map { ($0, 1) })
        var cnt = small.count
        var lo = 0
        for hi in 0..<big.count {
            let num = big[hi]
            if let n = dict[num] {
                dict[num] = n - 1
                if n == 1 {
                    cnt -= 1
                }
            }
            while cnt == 0 {
                if ans.isEmpty {
                    ans = [lo, hi]
                } else if ans[1] - ans[0] > hi - lo {
                    ans = [lo, hi]
                }
                let num = big[lo]
                lo += 1
                if let n = dict[num] {
                    dict[num] = n + 1
                    if n == 0 {
                        cnt += 1
                    }
                }
            }
        }
        return ans
    }
}

//: [Next](@next)
