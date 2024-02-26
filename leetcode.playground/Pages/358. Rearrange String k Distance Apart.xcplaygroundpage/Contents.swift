//: [Previous](@previous)

/*
 358. Rearrange String k Distance Apart
 困难
 
 Given a string s and an integer k, rearrange s such that the same characters are at least distance k from each other. If it is not possible to rearrange the string, return an empty string "".

  

 Example 1:

 Input: s = "aabbcc", k = 3
 Output: "abcabc"
 Explanation: The same letters are at least a distance of 3 from each other.
 Example 2:

 Input: s = "aaabc", k = 3
 Output: ""
 Explanation: It is not possible to rearrange the string.
 Example 3:

 Input: s = "aaadbbcc", k = 2
 Output: "abacabcd"
 Explanation: The same letters are at least a distance of 2 from each other.
  

 Constraints:

 1 <= s.length <= 3 * 105
 s consists of only lowercase English letters.
 0 <= k <= s.length
 */

import Foundation

class Solution {
    
    struct Freq: CustomStringConvertible {
        let c: String
        var cnt: Int

        var description: String { "\(cnt):\(c)"}
    }
    
    func rearrangeString(_ s: String, _ k: Int) -> String {
        if k < 2 { return s }
        var freq = [String: Int]()
        for c in s {
            let c = String(c)
            let cnt = freq[c] ?? 0
            freq[c] = cnt + 1
        }
        let freqs = freq.map { (k, v) in
            return Freq(c: k, cnt: v)
        }
        var heap = Heap(elements: freqs) { a, b in
            if a.cnt == b.cnt {
                return a.c <= b.c
            }
            return a.cnt > b.cnt
        }
        var ans = ""
        while heap.elements.count >= k {
            var todo = [Freq]()
            for _ in 0..<k {
                var freq = heap.dequeue()!
                ans.append(freq.c)
                freq.cnt -= 1
                if freq.cnt > 0 {
                    todo.append(freq)
                }
            }
            for freq in todo {
                heap.enqueue(freq)
            }
        }
        while heap.elements.count > 0 {
            let freq = heap.dequeue()!
            if freq.cnt == 1 {
                ans += freq.c
            } else {
                return ""
            }
        }
        return ans
    }
}


//: [Next](@next)
