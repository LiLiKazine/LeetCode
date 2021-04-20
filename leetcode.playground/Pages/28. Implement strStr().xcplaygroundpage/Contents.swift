//: [Previous](@previous)

/*
 
 28. Implement strStr()
 
 Implement strStr().

 Return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.

 Clarification:

 What should we return when needle is an empty string? This is a great question to ask during an interview.

 For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().

  

 Example 1:

 Input: haystack = "hello", needle = "ll"
 Output: 2
 Example 2:

 Input: haystack = "aaaaa", needle = "bba"
 Output: -1
 Example 3:

 Input: haystack = "", needle = ""
 Output: 0
  

 Constraints:

 0 <= haystack.length, needle.length <= 5 * 104
 haystack and needle consist of only lower-case English characters.
 
 */

/*
 
 class Solution {
 public:
     int strStr(string haystack, string needle) {
         int n = haystack.size(), m = needle.size();
         for (int i = 0; i + m <= n; i++) {
             bool flag = true;
             for (int j = 0; j < m; j++) {
                 if (haystack[i + j] != needle[j]) {
                     flag = false;
                     break;
                 }
             }
             if (flag) {
                 return i;
             }
         }
         return -1;
     }
 };
 
 */

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else {
            return -1
        }
        let haystack = Array(haystack), needle = Array(needle)
        let n = haystack.count, m = needle.count
        for i in 0...n-m {
            var flag = true;
            for j in 0..<m {
                if (haystack[i + j] != needle[j]) {
                    flag = false;
                    break;
                }
            }
            if (flag) {
                return i;
            }
        }
        return -1;
    }
        /*
    func strStr(_ haystack: String, _ needle: String) -> Int {
        guard haystack.count >= needle.count else {
            return -1
        }
        if needle.isEmpty {
            return 0
        }
        let haystack = Array(haystack), needle = Array(needle)
        var i = 0, j = 0
        while i < haystack.count && j < needle.count {
            var i1 = i, j1 = j
            while i1 < haystack.count && j1 < needle.count && haystack[i1] == needle[j1] {
                i1 += 1
                j1 += 1
            }
            
            if j1 == needle.count {
                return i
            } else {
                i += 1
                j = 0
            }
        }
        return -1
    }
 */
}

let haystack = "aaaaa", needle = "bba"
//let haystack = "hello", needle = "ll"
let solution = Solution()
let ans = solution.strStr(haystack, needle)
ans

//: [Next](@next)
