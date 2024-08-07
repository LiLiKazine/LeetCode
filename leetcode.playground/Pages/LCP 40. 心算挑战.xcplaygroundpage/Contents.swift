//: [Previous](@previous)

/*
 LCP 40. 心算挑战
 简单
 「力扣挑战赛」心算项目的挑战比赛中，要求选手从 N 张卡牌中选出 cnt 张卡牌，若这 cnt 张卡牌数字总和为偶数，则选手成绩「有效」且得分为 cnt 张卡牌数字总和。 给定数组 cards 和 cnt，其中 cards[i] 表示第 i 张卡牌上的数字。 请帮参赛选手计算最大的有效得分。若不存在获取有效得分的卡牌方案，则返回 0。

 示例 1：

 输入：cards = [1,2,8,9], cnt = 3

 输出：18

 解释：选择数字为 1、8、9 的这三张卡牌，此时可获得最大的有效得分 1+8+9=18。

 示例 2：

 输入：cards = [3,3,1], cnt = 1

 输出：0

 解释：不存在获取有效得分的卡牌方案。

 提示：

 1 <= cnt <= cards.length <= 10^5
 1 <= cards[i] <= 1000
 */

import Foundation

class Solution {
    func maxmiumScore(_ cards: [Int], _ cnt: Int) -> Int {
        let cards = cards.sorted(by: >)
        var sum = 0
        for i in 0..<cnt {
            sum += cards[i]
        }
        if sum % 2 == 0 {
            return sum
        }
        var ans = 0
        for i in stride(from: cnt-1, through: 0, by: -1) {
            var sum = sum
            guard cards[i] % 2 == 0 else {
                continue
            }
            sum -= cards[i]
            for j in cnt..<cards.count {
                if cards[j] % 2 != 0 {
                    sum += cards[j]
                    ans = max(ans, sum)
                    break
                }
            }
            break
        }
        for i in stride(from: cnt-1, through: 0, by: -1) {
            var sum = sum
            guard cards[i] % 2 != 0 else {
                continue
            }
            sum -= cards[i]
            for j in cnt..<cards.count {
                if cards[j] % 2 == 0 {
                    sum += cards[j]
                    ans = max(ans, sum)
                    break
                }
            }
            break
        }
        return ans
    }
}

//: [Next](@next)
