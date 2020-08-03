//: [Previous](@previous)

/*
 
 410. Split Array Largest Sum
 
 Given an array which consists of non-negative integers and an integer m, you can split the array into m non-empty continuous subarrays. Write an algorithm to minimize the largest sum among these m subarrays.

 Note:
 If n is the length of array, assume the following constraints are satisfied:

 1 ≤ n ≤ 1000
 1 ≤ m ≤ min(50, n)
 Examples:

 Input:
 nums = [7,2,5,10,8]
 m = 2

 Output:
 18

 Explanation:
 There are four ways to split nums into two subarrays.
 The best way is to split it into [7,2,5] and [10,8],
 where the largest sum among the two subarrays is only 18.
 
 */

class Solution {
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        var cache: [Key: Int] = [.init(0, 0): 0]
        var sums: [Int] = [0] + nums
        for i in 1..<sums.count {
            sums[i] += sums[i-1]
        }
        print(sums)
        for i in 1...nums.count {
            for j in 1...min(m, i) {
                for k in 0..<i {
                    let a = cache[.init(k, j-1)] ?? Int.max
                    let b = sums[i]-sums[k]
                    if cache[.init(i, j)] == nil {
                        cache[.init(i, j)] = max(a, b)
                    } else {
                        cache[.init(i, j)] = min(max(a, b), cache[.init(i, j)]!)
                    }
                }
            }
        }
        return cache[.init(nums.count, m)]!
    }
    
    struct Key: Hashable {
        var i: Int
        var j: Int
        init(_ i: Int, _ j: Int) {
            self.i = i
            self.j = j
        }
    }
    
}

let solution = Solution()
let ans = solution.splitArray([1,4,4], 3)
ans

//: [Next](@next)
