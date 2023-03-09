//: [Previous](@previous)

/*
 
 2379. Minimum Recolors to Get K Consecutive Black Blocks
 
 You are given a 0-indexed string blocks of length n, where blocks[i] is either 'W' or 'B', representing the color of the ith block. The characters 'W' and 'B' denote the colors white and black, respectively.

 You are also given an integer k, which is the desired number of consecutive black blocks.

 In one operation, you can recolor a white block such that it becomes a black block.

 Return the minimum number of operations needed such that there is at least one occurrence of k consecutive black blocks.

  

 Example 1:

 Input: blocks = "WBBWWBBWBW", k = 7
 Output: 3
 Explanation:
 One way to achieve 7 consecutive black blocks is to recolor the 0th, 3rd, and 4th blocks
 so that blocks = "BBBBBBBWBW".
 It can be shown that there is no way to achieve 7 consecutive black blocks in less than 3 operations.
 Therefore, we return 3.
 Example 2:

 Input: blocks = "WBWBBBW", k = 2
 Output: 0
 Explanation:
 No changes need to be made, since 2 consecutive black blocks already exist.
 Therefore, we return 0.
  

 Constraints:

 n == blocks.length
 1 <= n <= 100
 blocks[i] is either 'W' or 'B'.
 1 <= k <= n
 
 */

class Solution {
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {

        let blocks = blocks.map { String($0) }
        var ans = k, start = 0, num = 0
        
        for (i, s) in blocks.enumerated() {
            if s == "W" {
                num += 1
            }
            
            let consecutive = i - start + 1
            if consecutive >= k {
                ans = min(ans, num)
                if blocks[start] == "W" {
                    num -= 1
                }
                start += 1
            }
                
        }
        
        return ans
    }
}

//let blocks = "WBBWWBBWBW", k = 7
let blocks = "WBWBBBW", k = 2
let solution = Solution()
let ans = solution.minimumRecolors(blocks, k)

print(ans)

//: [Next](@next)
