//: [Previous](@previous)

/*
 
 1002. Find Common Characters
 
 Given an array A of strings made only from lowercase letters, return a list of all characters that show up in all strings within the list (including duplicates).  For example, if a character occurs 3 times in all strings but not 4 times, you need to include that character three times in the final answer.

 You may return the answer in any order.

  

 Example 1:

 Input: ["bella","label","roller"]
 Output: ["e","l","l"]
 Example 2:

 Input: ["cool","lock","cook"]
 Output: ["c","o"]
  

 Note:

 1 <= A.length <= 100
 1 <= A[i].length <= 100
 A[i][j] is a lowercase letter
 
 */

/*
 
 class Solution {
     public List<String> commonChars(String[] A) {
         int[] minfreq = new int[26];
         Arrays.fill(minfreq, Integer.MAX_VALUE);
         for (String word: A) {
             int[] freq = new int[26];
             int length = word.length();
             for (int i = 0; i < length; ++i) {
                 char ch = word.charAt(i);
                 ++freq[ch - 'a'];
             }
             for (int i = 0; i < 26; ++i) {
                 minfreq[i] = Math.min(minfreq[i], freq[i]);
             }
         }

         List<String> ans = new ArrayList<String>();
         for (int i = 0; i < 26; ++i) {
             for (int j = 0; j < minfreq[i]; ++j) {
                 ans.add(String.valueOf((char) (i + 'a')));
             }
         }
         return ans;
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/find-common-characters/solution/cha-zhao-chang-yong-zi-fu-by-leetcode-solution/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func commonChars(_ A: [String]) -> [String] {
        var minfreq = [Character: Int]()
        for i in 0..<A.count {
            let a = A[i]
            var freq = [Character: Int]()
            for c in a {
                if freq[c] == nil {
                    freq[c] = 1
                } else {
                    freq[c]! += 1
                }
            }
            
            if i == 0 {
                minfreq = freq
                continue
            }
            for key in minfreq.keys {
                if freq[key] == nil {
                    minfreq.removeValue(forKey: key)
                } else {
                    minfreq[key] = min(minfreq[key]!, freq[key]!)
                }
            }
        }
        return minfreq.reduce([String]()) { (res, arg1) -> [String] in
            let (key, val) = arg1
            let cs = Array<String>(repeating: String(key), count: val)
            return res + cs;
        }
    }
}

let solution = Solution()
let ans = solution.commonChars(["acabcddd","bcbdbcbd","baddbadb","cbdddcac","aacbcccd","ccccddda","cababaab","addcaccd"])
ans

//: [Next](@next)
