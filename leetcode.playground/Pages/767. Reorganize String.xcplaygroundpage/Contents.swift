//: [Previous](@previous)

/*
 
 767. Reorganize String
 
 Given a string S, check if the letters can be rearranged so that two characters that are adjacent to each other are not the same.

 If possible, output any possible result.  If not possible, return the empty string.

 Example 1:

 Input: S = "aab"
 Output: "aba"
 Example 2:

 Input: S = "aaab"
 Output: ""
 Note:

 S will consist of lowercase letters and have length in range [1, 500].
 
 */

class Solution {
    func reorganizeString(_ S: String) -> String {
        var ans: [Character] = [], cache:[Character: Int] = [:]
        for c in S {
            cache[c] = cache[c].map{ $0 + 1 } ?? 1
        }
        for count in cache.values {
            if count > S.count / 2 + S.count % 2 {
                return ""
            }
        }
        var sorted = cache.sorted(by: { $0.1 > $1.1 })
        guard sorted.count > 1 else {
            return String(sorted[0].key)
        }
        while !sorted.isEmpty {
            if sorted[0].value > 0 {
                ans.append(sorted[0].key)
                sorted[0].value -= 1
            } else {
                break
            }
            if sorted[1].value > 0 {
                ans.append(sorted[1].key)
                sorted[1].value -= 1
            }
            sorted.sort(by: {$0.1 > $1.1})
        }
        return String(ans)
    }
}
let S = "aab"
let solution = Solution()
let ans = solution.reorganizeString(S)
ans

//: [Next](@next)
