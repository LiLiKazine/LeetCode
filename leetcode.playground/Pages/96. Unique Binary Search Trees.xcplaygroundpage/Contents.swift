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

/*
 
  for (int i = 2; i <= n; ++i) {
             for (int j = 1; j <= i; ++j) {
                 G[i] += G[j - 1] * G[i - j];
             }
         }

 */

class Solution {
    
    var cache: [Int: Int] = [:]
    init() {
        cache[0] = 1
        cache[1] = 1
    }
    
    func numTrees(_ n: Int) -> Int {
        
        if let num = cache[n] {
            return num
        }
        
        for i in 2...n {
            for j in 1...i {
                cache[i] = (cache[i] ?? 0) + cache[j-1]! * cache[i-j]!
            }
        }
        print(cache)
        return cache[n]!
    }
    
}

let solution = Solution()
let ans = solution.numTrees(3)
ans

//: [Next](@next)
