//: [Previous](@previous)

/*
 1647. Minimum Deletions to Make Character Frequencies Unique
 中等
 A string s is called good if there are no two different characters in s that have the same frequency.

 Given a string s, return the minimum number of characters you need to delete to make s good.

 The frequency of a character in a string is the number of times it appears in the string. For example, in the string "aab", the frequency of 'a' is 2, while the frequency of 'b' is 1.

  

 Example 1:

 Input: s = "aab"
 Output: 0
 Explanation: s is already good.
 Example 2:

 Input: s = "aaabbbcc"
 Output: 2
 Explanation: You can delete two 'b's resulting in the good string "aaabcc".
 Another way it to delete one 'b' and one 'c' resulting in the good string "aaabbc".
 Example 3:

 Input: s = "ceabaacb"
 Output: 2
 Explanation: You can delete both 'c's resulting in the good string "eabaab".
 Note that we only care about characters that are still in the string at the end (i.e. frequency of 0 is ignored).
  

 Constraints:

 1 <= s.length <= 105
 s contains only lowercase English letters.

 */

import Foundation

class Solution {
    func minDeletions(_ s: String) -> Int {
        let s = Array(s)
        var map = [Character: Int]()
        var cnt = Set<Int>()
        for c in s {
            map[c] = (map[c] ?? 0) + 1
        }
        var todo = [Int]()
        for (key, value) in map {
            let (inserted, _) = cnt.insert(value)
            if !inserted {
                todo.append(value)
            }
        }
        if todo.isEmpty {
            return 0
        }
        todo.sort(by: >)
        var ans = 0, end = todo[0] - 1
        next: while todo.count > 0 {
            let n = todo.removeFirst()
                for i in stride(from: min(end, n-1), through: 1, by: -1) {
                    let (inserted, _) = cnt.insert(i)
                    if inserted {
                        print("inserted:", i)
                        end -= 1
                        ans += (n - i)
                        continue next
                    }
                }
            ans += n
        }
        return ans
    }
}

//: [Next](@next)
