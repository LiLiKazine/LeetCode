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
     // KMP 算法
     // ss: 原串(string)  pp: 匹配串(pattern)
     public int strStr(String ss, String pp) {
         if (pp.isEmpty()) return 0;
         
         // 分别读取原串和匹配串的长度
         int n = ss.length(), m = pp.length();
         // 原串和匹配串前面都加空格，使其下标从 1 开始
         ss = " " + ss;
         pp = " " + pp;

         char[] s = ss.toCharArray();
         char[] p = pp.toCharArray();

         // 构建 next 数组，数组长度为匹配串的长度（next 数组是和匹配串相关的）
         int[] next = new int[m + 1];
         // 构造过程 i = 2，j = 0 开始，i 小于等于匹配串长度 【构造 i 从 2 开始】
         for (int i = 2, j = 0; i <= m; i++) {
             // 匹配不成功的话，j = next(j)
             while (j > 0 && p[i] != p[j + 1]) j = next[j];
             // 匹配成功的话，先让 j++
             if (p[i] == p[j + 1]) j++;
             // 更新 next[i]，结束本次循环，i++
             next[i] = j;
         }

         // 匹配过程，i = 1，j = 0 开始，i 小于等于原串长度 【匹配 i 从 1 开始】
         for (int i = 1, j = 0; i <= n; i++) {
             // 匹配不成功 j = next(j)
             while (j > 0 && s[i] != p[j + 1]) j = next[j];
             // 匹配成功的话，先让 j++，结束本次循环后 i++
             if (s[i] == p[j + 1]) j++;
             // 整一段匹配成功，直接返回下标
             if (j == m) return i - m;
         }

         return -1;
     }
 }

 作者：宫水三叶
 链接：https://leetcode.cn/problems/find-the-index-of-the-first-occurrence-in-a-string/solutions/575568/shua-chuan-lc-shuang-bai-po-su-jie-fa-km-tb86/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

/*
 class Solution {
     func strStr(_ haystack: String, _ needle: String) -> Int {
         guard !haystack.isEmpty && !needle.isEmpty else { return -1 }
         var haystackChars = Array(haystack), needleChars = Array(needle)
         guard haystackChars.count >= needleChars.count else { return -1 }
         for idx in 0..<haystackChars.count {
             guard idx + needleChars.count <= haystackChars.count else {
                 return -1
             }
             var start = idx, end = idx + needleChars.count
             for (_, item) in needleChars.enumerated() {
                 if (item != haystackChars[start]) {
                     break
                 }
                 start += 1
             }
             if (start == end) {
                 return idx;
             }
         }
         return -1
     }
 }
 */

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty { return  0 }
        var i = 0
        while i < haystack.count {
            if haystack[haystack.index(haystack.startIndex, offsetBy: i)...].hasPrefix(needle) {
                return i
            }
            i += 1
        }
        return -1
    }
       
}

let haystack = "aaaaa", needle = "bba"
//let haystack = "hello", needle = "ll"
let solution = Solution()
let ans = solution.strStr(haystack, needle)
ans

//: [Next](@next)
