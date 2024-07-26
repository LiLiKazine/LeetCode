//: [Previous](@previous)

/*
 2067. Number of Equal Count Substrings
 中等
 You are given a 0-indexed string s consisting of only lowercase English letters, and an integer count. A substring of s is said to be an equal count substring if, for each unique letter in the substring, it appears exactly count times in the substring.

 Return the number of equal count substrings in s.

 A substring is a contiguous non-empty sequence of characters within a string.

  

 Example 1:

 Input: s = "aaabcbbcc", count = 3
 Output: 3
 Explanation:
 The substring that starts at index 0 and ends at index 2 is "aaa".
 The letter 'a' in the substring appears exactly 3 times.
 The substring that starts at index 3 and ends at index 8 is "bcbbcc".
 The letters 'b' and 'c' in the substring appear exactly 3 times.
 The substring that starts at index 0 and ends at index 8 is "aaabcbbcc".
 The letters 'a', 'b', and 'c' in the substring appear exactly 3 times.
 Example 2:

 Input: s = "abcd", count = 2
 Output: 0
 Explanation:
 The number of times each letter appears in s is less than count.
 Therefore, no substrings in s are equal count substrings, so return 0.
 Example 3:

 Input: s = "a", count = 5
 Output: 0
 Explanation:
 The number of times each letter appears in s is less than count.
 Therefore, no substrings in s are equal count substrings, so return 0
  

 Constraints:

 1 <= s.length <= 3 * 104
 1 <= count <= 3 * 104
 s consists only of lowercase English letters.
 */

import Foundation

/*
 class Solution {
     //长度固定为 m⋅k的滑动窗口,判断每种字符是否都出现了恰好 k 次
     public int equalCountSubstrings(String s, int count) {
         int n=s.length();
         int ans=0;
         for(int m=1;m<=26&&m*count<=n;m++){
             int[] cnt=new int[26];
             for(int right=0;right<n;right++){
                 cnt[s.charAt(right)-'a']++;
                 int left=right-m*count+1;
                 if(left>=0){
                     boolean flag=true;
                     for(int i=0;i<26;i++){
                         if(cnt[i]>0&&cnt[i]!=count){
                             flag=false;
                             break;
                         }
                     }
                     if(flag) ans++;
                     cnt[s.charAt(left)-'a']--;
                 }
             }
         }
         return ans;
     }
 }
 */

class Solution {
    func equalCountSubstrings(_ s: String, _ count: Int) -> Int {
        let s = Array(s)
        var len = count, ans = 0
        while len <= s.count {
            ans += equalCountSubstrings(s, count, len)
            len += count
        }
        return ans
    }
    
    func equalCountSubstrings(_ s: [Character], _ count: Int, _ len: Int) -> Int {
        var ans = 0, cnt = [Character: Int](), set = Set<Character>()
        func check(_ char: Character) {
            let val = cnt[char, default: 0]
            if val == 0 || val == count {
                set.remove(char)
            } else {
                set.insert(char)
            }
        }
        for i in 0..<s.count {
            let char = s[i]
            cnt[char] = cnt[char, default: 0] + 1
            check(char)
            if i >= len - 1 {
                if set.isEmpty {
                    ans += 1
                }
                let j = i - len + 1
                let prev = s[j]
                cnt[prev] = cnt[prev, default: 0] - 1
                check(prev)
            }
        }
        return ans
    }
}

//: [Next](@next)
