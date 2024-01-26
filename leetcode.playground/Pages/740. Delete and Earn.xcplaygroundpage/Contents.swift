//: [Previous](@previous)

/*
 
 740. Delete and Earn
 
 Given an array nums of integers, you can perform operations on the array.

 In each operation, you pick any nums[i] and delete it to earn nums[i] points. After, you must delete every element equal to nums[i] - 1 or nums[i] + 1.

 You start with 0 points. Return the maximum number of points you can earn by applying such operations.

  

 Example 1:

 Input: nums = [3,4,2]
 Output: 6
 Explanation: Delete 4 to earn 4 points, consequently 3 is also deleted.
 Then, delete 2 to earn 2 points.
 6 total points are earned.
 Example 2:

 Input: nums = [2,2,3,3,3,4]
 Output: 9
 Explanation: Delete 3 to earn 3 points, deleting both 2's and the 4.
 Then, delete 3 again to earn 3 points, and 3 again to earn 3 points.
 9 total points are earned.
  

 Constraints:

 1 <= nums.length <= 2 * 10^4
 1 <= nums[i] <= 10^4
 
 */


class Solution {
    func deleteAndEarn(_ nums: [Int]) -> Int {
        var dict: [Int: Int] = [:]
        for num in nums {
            dict[num] = (dict[num] ?? 0) + num
        }
        
        let keys = dict.keys.sorted()
        
        var gains = 0
        var earns = [Int]()
        for i in 0..<keys.count {
            if earns.isEmpty || keys[i-1] + 1 == keys[i]{
                earns.append(dict[keys[i]]!)
            } else {
                gains += houseRob(earns: earns)
                earns.removeAll()
                earns.append(dict[keys[i]]!)
            }
        }
        if earns.count > 0 {
            gains += houseRob(earns: earns)
        }
        return gains
    }
    
    func houseRob(earns: [Int]) -> Int {
        if earns.isEmpty { return  0 }
        if earns.count == 1 { return earns[0] }
        if earns.count == 2 { return max(earns[0], earns[1]) }
        
        var a = earns[0], b = earns[1]
        for i in 2..<earns.count {
            let val = a + earns[i]
            a = max(a, b)
            b = val
        }
        return max(a, b)
    }
}

let solution = Solution()
//let nums = [2,2,3,3,3,4]
//let nums = [3,4,2]
let nums = [3,1]
let ans = solution.deleteAndEarn(nums)

//: [Next](@next)
