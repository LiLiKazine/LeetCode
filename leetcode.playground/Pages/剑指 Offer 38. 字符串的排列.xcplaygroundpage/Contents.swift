//: [Previous](@previous)

/*
 
 剑指 Offer 38. 字符串的排列
 
 输入一个字符串，打印出该字符串中字符的所有排列。

  

 你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。

  

 示例:

 输入：s = "abc"
 输出：["abc","acb","bac","bca","cab","cba"]
  

 限制：

 1 <= s 的长度 <= 8

 */

class Solution {
    func permutation(_ s: String) -> [String] {
        let ans = backTrace([], Array(s).sorted())
        return ans
    }
    
    private func backTrace(_ prefix: [Character], _ candidates: [Character]) -> [String] {
        if candidates.isEmpty {
            return [String(prefix)]
        }
        var ans: [String] = []
        for i in 0..<candidates.count {
            let character = candidates[i]
            if i > 0 && candidates[i - 1] == character {
                continue
            }
            var leftover = candidates
            leftover.remove(at: i)
            let res = backTrace(prefix + [character], leftover)
            ans.append(contentsOf: res)
        }
        return ans
    }
}

//let s = "abc"
let s = "aab"
let solution = Solution()
let ans = solution.permutation(s)
ans

//: [Next](@next)
