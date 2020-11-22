//: [Previous](@previous)

/*
 
 997. Find the Town Judge
 
 In a town, there are N people labelled from 1 to N.  There is a rumor that one of these people is secretly the town judge.

 If the town judge exists, then:

 The town judge trusts nobody.
 Everybody (except for the town judge) trusts the town judge.
 There is exactly one person that satisfies properties 1 and 2.
 You are given trust, an array of pairs trust[i] = [a, b] representing that the person labelled a trusts the person labelled b.

 If the town judge exists and can be identified, return the label of the town judge.  Otherwise, return -1.

  

 Example 1:

 Input: N = 2, trust = [[1,2]]
 Output: 2
 Example 2:

 Input: N = 3, trust = [[1,3],[2,3]]
 Output: 3
 Example 3:

 Input: N = 3, trust = [[1,3],[2,3],[3,1]]
 Output: -1
 Example 4:

 Input: N = 3, trust = [[1,2],[2,3]]
 Output: -1
 Example 5:

 Input: N = 4, trust = [[1,3],[1,4],[2,3],[2,4],[4,3]]
 Output: 3
  

 Constraints:

 1 <= N <= 1000
 0 <= trust.length <= 10^4
 trust[i].length == 2
 trust[i] are all different
 trust[i][0] != trust[i][1]
 1 <= trust[i][0], trust[i][1] <= Na
 
 */

class Solution {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        var directions: [[Int]] = Array(repeating: [0, 0], count: N + 1)
        for relation in trust {
            directions[relation[0]][1] += 1
            directions[relation[1]][0] += 1
        }
        for i in 1..<directions.count {
            let dir = directions[i]
            if dir[0] == N - 1 && dir[1] == 0 {
                return i
            }
        }
        return -1
    }
}


let N = 2,
    trust = [[1,2]]
let solution = Solution()
let ans = solution.findJudge(N, trust)

//: [Next](@next)
