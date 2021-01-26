//: [Previous](@previous)

/*
 
 1128. Number of Equivalent Domino Pairs
 
 Given a list of dominoes, dominoes[i] = [a, b] is equivalent to dominoes[j] = [c, d] if and only if either (a==c and b==d), or (a==d and b==c) - that is, one domino can be rotated to be equal to another domino.

 Return the number of pairs (i, j) for which 0 <= i < j < dominoes.length, and dominoes[i] is equivalent to dominoes[j].

  

 Example 1:

 Input: dominoes = [[1,2],[2,1],[3,4],[5,6]]
 Output: 1
  

 Constraints:

 1 <= dominoes.length <= 40000
 1 <= dominoes[i][j] <= 9
 
 */

class Solution {
    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var group: [Int: Int] = [:], ans = 0
        for domino in dominoes {
            let key = min(domino[0], domino[1]) * 10 + max(domino[0], domino[1])
            group[key] = (group[key] ?? 0) + 1
        }
        for val in group.values {
            guard val > 1 else {
                continue
            }
            ans += (val - 1) * val / 2
        }
        return ans
    }
}

let dominoes = [[1,2],[2,1],[3,4],[5,6]]
let solution = Solution()
let ans = solution.numEquivDominoPairs(dominoes)
ans


//: [Next](@next)
