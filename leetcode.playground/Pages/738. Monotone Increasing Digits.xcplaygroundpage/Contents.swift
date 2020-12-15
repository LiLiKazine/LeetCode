//: [Previous](@previous)

/*
 
 738. Monotone Increasing Digits
 
 Given a non-negative integer N, find the largest number that is less than or equal to N with monotone increasing digits.

 (Recall that an integer has monotone increasing digits if and only if each pair of adjacent digits x and y satisfy x <= y.)

 Example 1:
 Input: N = 10
 Output: 9
 Example 2:
 Input: N = 1234
 Output: 1234
 Example 3:
 Input: N = 332
 Output: 299
 Note: N is an integer in the range [0, 10^9].
 
 */

class Solution {
    func monotoneIncreasingDigits(_ N: Int) -> Int {
        let s = Array(String(N))
        var ans: [String] = [], flag = false, beacon = 0, i = 0
        while i < s.count {
            if flag {
                ans.append("9")
                i += 1
                continue
            }
            let c = s[i], val = Int(String(c))!
            
            if i > 0 && val < Int(String(s[beacon]))! {
                ans[beacon] = String(Int(ans[beacon])!-1)
                flag = true
                ans.removeLast(i-beacon-1)
                i = beacon
            } else {
                if val > Int(String(s[beacon]))! {
                    beacon = i
                }
                ans.append(String(c))
            }
            i += 1
        }
        return Int(ans.reduce("", +))!
    }
}

let solution = Solution()
let ans = solution.monotoneIncreasingDigits(332)
ans

//: [Next](@next)
