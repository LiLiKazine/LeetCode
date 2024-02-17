//: [Previous](@previous)

/*
 484. Find Permutation
 
 A permutation perm of n integers of all the integers in the range [1, n] can be represented as a string s of length n - 1 where:

 s[i] == 'I' if perm[i] < perm[i + 1], and
 s[i] == 'D' if perm[i] > perm[i + 1].
 Given a string s, reconstruct the lexicographically smallest permutation perm and return it.

  

 Example 1:

 Input: s = "I"
 Output: [1,2]
 Explanation: [1,2] is the only legal permutation that can represented by s, where the number 1 and 2 construct an increasing relationship.
 Example 2:

 Input: s = "DI"
 Output: [2,1,3]
 Explanation: Both [2,1,3] and [3,1,2] can be represented as "DI", but since we want to find the smallest lexicographical permutation, you should return [2,1,3]
  

 Constraints:

 1 <= s.length <= 105
 s[i] is either 'I' or 'D'.
 
 */

import Foundation

class Solution {
    func findPermutation(_ s: String) -> [Int] {
        let s = Array(s).map {String($0) }
        var ans = [1], decrease = [Int]()
        for i in 0..<s.count {
            let val = i + 2
            if s[i] == "I" {
                ans.append(contentsOf: decrease.reversed())
                decrease.removeAll()
                ans.append(val)
            } else {
                if decrease.isEmpty {
                    decrease.append(ans.removeLast())
                }
                decrease.append(val)
            }
        }
        ans.append(contentsOf: decrease.reversed())
        return ans
    }
}

//: [Next](@next)
