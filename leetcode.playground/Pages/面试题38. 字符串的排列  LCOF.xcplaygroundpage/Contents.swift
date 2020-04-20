//: [Previous](@previous)

/*
 
 面试题38. 字符串的排列  LCOF
 
 输入一个字符串，打印出该字符串中字符的所有排列。

  
 你可以以任意顺序返回这个字符串数组，但里面不能有重复元素。

  
 示例:

 输入：s = "abc"
 输出：["abc","acb","bac","bca","cab","cba"]
  

 限制：

 1 <= s 的长度 <= 8
 
 */

import Foundation

class Solution {
    
    func permutation(_ s: String) -> [String] {
        if s.count == 1 {
            return [s]
        }
        var ans: Set<String> = .init()
        for i in 0..<s.count {
            var copy = s
            let c = copy.remove(at: .init(utf16Offset: i, in: copy))
            var arr = permutation(copy)
            arr = arr.map{ $0 + String(c) }
            for a in arr {
                ans.insert(a)
            }
        }
        return Array(ans)
    }
}

let solution = Solution()
let ans = solution.permutation("abc")

//: [Next](@next)
