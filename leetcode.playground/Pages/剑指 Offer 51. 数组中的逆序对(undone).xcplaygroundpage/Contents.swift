//: [Previous](@previous)

/*
 
 剑指 Offer 51. 数组中的逆序对
 
 在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。

  

 示例 1:

 输入: [7,5,6,4]
 输出: 5
  

 限制：

 0 <= 数组长度 <= 50000
 
 */

class Solution {
    var count: Int = 0
    func reversePairs(_ nums: [Int]) -> Int {
        let _ = merge(nums)
        return count
    }
    
    func merge2(_ nums: [Int], _ head: Int, _ tail: Int, _ temp: inout [Int]) -> Int {
        var count = 0
        
        let mid = (head + tail) / 2
        
        
        
        return count
    }
    
    func merge(_ nums: [Int]) -> [Int] {
        if nums.count < 2 {
            return nums
        }
        let head = 0, tail = nums.count
        let mid = (head + tail) / 2
        var left = merge(Array(nums[0..<mid])),
        right = merge(Array(nums[mid..<tail]))
        if left.isEmpty || right.isEmpty || left.last! <= right.first! {
            return left + right
        }
        
        var ans: [Int] = []
        var i = 0
        while !left.isEmpty && !right.isEmpty {
            if left.first! <= right.first! {
                ans.append(left.removeFirst())
                 i += 1
            } else {
                print(count)
                count += (mid-i+1)
                ans.append(right.removeFirst())
            }
        }
        ans.append(contentsOf: left)
        ans.append(contentsOf: right)
        return ans
    }
}

let solution = Solution()
let ans = solution.reversePairs([7,5,6,4])
ans
//: [Next](@next)
