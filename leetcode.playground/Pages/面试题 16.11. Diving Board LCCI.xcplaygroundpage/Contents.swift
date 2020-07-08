//: [Previous](@previous)

/*
 
 面试题 16.11. Diving Board LCCI
 
 You are building a diving board by placing a bunch of planks of wood end-to-end. There are two types of planks, one of length shorter and one of length longer. You must use exactly K planks of wood. Write a method to generate all possible lengths for the diving board.

 return all lengths in non-decreasing order.

 Example:

 Input:
 shorter = 1
 longer = 2
 k = 3
 Output:  {3,4,5,6}
 Note:

 0 < shorter <= longer
 0 <= k <= 100000
 
 */

class Solution {
    func divingBoard(_ shorter: Int, _ longer: Int, _ k: Int) -> [Int] {
        if k == 0 {
            return []
        }
        if shorter == longer {
            return [k * shorter]
        }
        var ans: [Int] = []
        for i in 0...k {
            ans.append(longer * i + shorter * (k-i))
        }
        
        return ans
    }
    
    func weld(_ shorter: Int, _ longer: Int, _ k: Int, _ length: Int) -> [Int] {
        if k == 0 {
            return [length]
        }
        return weld(shorter, longer, k-1, shorter + length) + weld(shorter, longer, k-1, longer + length)
    }
}

let solution = Solution()
let ans = solution.divingBoard(1, 1, 1000000)
ans

//: [Next](@next)
