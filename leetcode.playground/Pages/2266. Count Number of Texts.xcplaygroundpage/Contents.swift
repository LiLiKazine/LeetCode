//: [Previous](@previous)

/*
 2266. Count Number of Texts
 中等
 Alice is texting Bob using her phone. The mapping of digits to letters is shown in the figure below.


 In order to add a letter, Alice has to press the key of the corresponding digit i times, where i is the position of the letter in the key.

 For example, to add the letter 's', Alice has to press '7' four times. Similarly, to add the letter 'k', Alice has to press '5' twice.
 Note that the digits '0' and '1' do not map to any letters, so Alice does not use them.
 However, due to an error in transmission, Bob did not receive Alice's text message but received a string of pressed keys instead.

 For example, when Alice sent the message "bob", Bob received the string "2266622".
 Given a string pressedKeys representing the string received by Bob, return the total number of possible text messages Alice could have sent.

 Since the answer may be very large, return it modulo 109 + 7.

  

 Example 1:

 Input: pressedKeys = "22233"
 Output: 8
 Explanation:
 The possible text messages Alice could have sent are:
 "aaadd", "abdd", "badd", "cdd", "aaae", "abe", "bae", and "ce".
 Since there are 8 possible messages, we return 8.
 Example 2:

 Input: pressedKeys = "222222222222222222222222222222222222"
 Output: 82876089
 Explanation:
 There are 2082876103 possible text messages Alice could have sent.
 Since we need to return the answer modulo 109 + 7, we return 2082876103 % (109 + 7) = 82876089.
  

 Constraints:

 1 <= pressedKeys.length <= 105
 pressedKeys only consists of digits from '2' - '9'.
 */

import Foundation

class Solution {
    func countTexts(_ pressedKeys: String) -> Int {
        let counts = [3, 3, 3, 3, 3, 4, 3, 4]
        let module = 1_000_000_007
        
        let keys = pressedKeys.compactMap { Int(String($0)) }.map { $0 - 2 }
        var cache = [Int: Int]()
        func dfs(_ i: Int) -> Int {
            guard i < keys.count else {
                return 1
            }
            if let res = cache[i] {
                return res
            }
            var j = i
            while j < keys.count && keys[j] == keys[i] && j - i + 1 <= counts[keys[i]] {
                j += 1
            }
            var res = 0
            for k in i+1...j {
                res += dfs(k)
                res %= module
            }
            cache[i] = res
            return res
        }
        return dfs(0)
    }
}

//: [Next](@next)
