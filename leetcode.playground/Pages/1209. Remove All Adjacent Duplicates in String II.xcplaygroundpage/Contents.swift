//: [Previous](@previous)

/*
 
 1209. Remove All Adjacent Duplicates in String II
 
 Given a string s, a k duplicate removal consists of choosing k adjacent and equal letters from s and removing them causing the left and the right side of the deleted substring to concatenate together.

 We repeatedly make k duplicate removals on s until we no longer can.

 Return the final string after all such duplicate removals have been made.

 It is guaranteed that the answer is unique.

  

 Example 1:

 Input: s = "abcd", k = 2
 Output: "abcd"
 Explanation: There's nothing to delete.
 Example 2:

 Input: s = "deeedbbcccbdaa", k = 3
 Output: "aa"
 Explanation:
 First delete "eee" and "ccc", get "ddbbbdaa"
 Then delete "bbb", get "dddaa"
 Finally delete "ddd", get "aa"
 Example 3:

 Input: s = "pbbcggttciiippooaais", k = 2
 Output: "ps"
  

 Constraints:

 1 <= s.length <= 10^5
 2 <= k <= 10^4
 s only contains lower case English letters.
 
 */

import Foundation

class Solution {
    func removeDuplicates(_ s: String, _ k: Int) -> String {
        return stack(s, k)
    }
    
    func stack(_ s: String, _ k: Int) -> String {
        var s = [Character](s), stack: [Int] = []
        var i = 0 
        while i < s.count {
            let c = s[i]
            if i == 0 || s[i-1] != c {
                stack.append(1)
                i+=1
            } else {
                if var last = stack.popLast() {
                    last += 1
                    if last == k {
                        s.removeSubrange(i-k+1...i)
                        i = i-k+1
                    } else {
                        stack.append(last)
                        i+=1
                    }
                }
            }
            
        }
        return String(s)
    }
    
    func exceeded(_ s: String, _ k: Int) -> String {
        if s.isEmpty {
            return s
        }
        var string = [Character](s), flag = true
        while flag {
            var i = 0
            flag = false
            while i < string.count {
                var j = i+1, head: Character = string[i]
                while j < string.count, string[j] == head, j-i<k {
                    j += 1
                }
                if j - i >= k {
                    flag = true
                    string.removeSubrange(i..<j)
                } else {
                    i += 1
                }
                if string.count == 0 {
                    return ""
                }
            }
        }
        return String(string)
    }
}

let s = "deeedbbcccbdaa"
let k = 3
let solution = Solution()
let ans = solution.removeDuplicates(s, k)
/*
    
    public String removeDuplicates(String s, int k) {
        StringBuilder sb = new StringBuilder(s);
        Stack<Integer> counts = new Stack<>();
        for (int i = 0; i < sb.length(); ++i) {
            if (i == 0 || sb.charAt(i) != sb.charAt(i - 1)) {
                counts.push(1);
            } else {
                int incremented = counts.pop() + 1;
                if (incremented == k) {
                    sb.delete(i - k + 1, i + 1);
                    i = i - k;
                } else {
                    counts.push(incremented);
                }
            }
        }
        return sb.toString();
    }
    
    */
   
//: [Next](@next)
