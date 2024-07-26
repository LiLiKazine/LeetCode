//: [Previous](@previous)

/*
 2953. Count Complete Substrings
 困难
 You are given a string word and an integer k.

 A substring s of word is complete if:

 Each character in s occurs exactly k times.
 The difference between two adjacent characters is at most 2. That is, for any two adjacent characters c1 and c2 in s, the absolute difference in their positions in the alphabet is at most 2.
 Return the number of complete substrings of word.

 A substring is a non-empty contiguous sequence of characters in a string.

  

 Example 1:

 Input: word = "igigee", k = 2
 Output: 3
 Explanation: The complete substrings where each character appears exactly twice and the difference between adjacent characters is at most 2 are: igigee, igigee, igigee.
 Example 2:

 Input: word = "aaabbbccc", k = 3
 Output: 6
 Explanation: The complete substrings where each character appears exactly three times and the difference between adjacent characters is at most 2 are: aaabbbccc, aaabbbccc, aaabbbccc, aaabbbccc, aaabbbccc, aaabbbccc.
  

 Constraints:

 1 <= word.length <= 105
 word consists only of lowercase English letters.
 1 <= k <= word.length
 
 */

import Foundation

/*
 class Solution {
     public int countCompleteSubstrings(String word, int k) {
         int n = word.length();
         int ans = 0;
         for (int i = 0; i < n; ) {
             int st = i;
             for (i++; i < n && Math.abs(word.charAt(i) - word.charAt(i - 1)) <= 2; i++) ;
             ans += f(word.substring(st, i), k);
         }
         return ans;
     }

     private int f(String S, int k) {
         char[] s = S.toCharArray();
         int res = 0;
         for (int m = 1; m <= 26 && k * m <= s.length; m++) {
             int[] cnt = new int[26];
             for (int right = 0; right < s.length; right++) {
                 cnt[s[right] - 'a']++;
                 int left = right + 1 - k * m;
                 if (left >= 0) {
                     boolean ok = true;
                     for (int i = 0; i < 26; i++) {
                         if (cnt[i] > 0 && cnt[i] != k) {
                             ok = false;
                             break;
                         }
                     }
                     if (ok) res++;
                     cnt[s[left] - 'a']--;
                 }
             }
         }
         return res;
     }
 }
 */

class Solution {
    func countCompleteSubstrings(_ word: String, _ k: Int) -> Int {
        func valid(_ a: Character, _ b: Character) -> Bool {
            let dif = Int(a.asciiValue!) - Int(b.asciiValue!)
            return abs(dif) <= 2
        }
        let word = Array(word)
        var i = 0, ans = 0
        while i < word.count {
            var start = i
            repeat {
                i += 1
            } while i < word.count && valid(word[i], word[i-1])
            let word = String(word[start..<i])
            var len = k
            while len <= word.count {
                ans += countCompleteSubstrings(word, k, len: len)
                len += k
            }
        }
        return ans
    }
    
    func countCompleteSubstrings(_ word: String, _ k: Int, len: Int) -> Int {
        var ans = 0
        var cnt = [Character: Int]()
        var set = Set<Character>()
        func check(_ char: Character) {
            let val = cnt[char, default: 0]
            if val == k || val == 0 {
                set.remove(char)
            } else {
                set.insert(char)
            }
        }
        let word = Array(word)
        for (i, char) in word.enumerated() {
            cnt[char] = cnt[char, default: 0] + 1
            check(char)
            if i >= len - 1 {
                if set.isEmpty {
                    ans += 1
                }
                let prev = word[i - len + 1]
                cnt[prev] = cnt[prev, default: 0] - 1
                check(prev)
            }
        }
        
        return ans
    }
}

//: [Next](@next)
