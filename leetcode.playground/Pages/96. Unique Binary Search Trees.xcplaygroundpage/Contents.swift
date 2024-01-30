//: [Previous](@previous)

/*
 
 96. Unique Binary Search Trees
 
 Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?

 Example:

 Input: 3
 Output: 5
 Explanation:
 Given n = 3, there are a total of 5 unique BST's:

    1         3     3      2      1
     \       /     /      / \      \
      3     2     1      1   3      2
     /     /       \                 \
    2     1         2                 3
 
 */

class Solution {
    
    func numTrees(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        for i in 2...n {
            for j in 1...i {
                dp[i] += dp[j-1] * dp[i - j]
            }
        }
        return dp[n]
    }
}

let solution = Solution()
let ans = solution.numTrees(3)
ans

//: [Next](@next)
