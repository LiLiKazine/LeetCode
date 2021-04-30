//: [Previous](@previous)

/*

 137. Single Number II
 
 Given an integer array nums where every element appears three times except for one, which appears exactly once. Find the single element and return it.

  

 Example 1:

 Input: nums = [2,2,3,2]
 Output: 3
 Example 2:

 Input: nums = [0,1,0,1,0,1,99]
 Output: 99
  

 Constraints:

 1 <= nums.length <= 3 * 104
 -231 <= nums[i] <= 231 - 1
 Each element in nums appears exactly three times except for one element which appears once.
  

 Follow up: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
 
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var ans = 0, map: [Int: Int] = [:]
        for n in nums {
            map[n] = (map[n] ?? 0) + 1
            if map[n]! == 3 {
                map.removeValue(forKey: n)
            }
        }
        for key in map.keys {
            if map[key]! == 1 {
                ans = key
                break
            }
        }
        return ans
    }
}

//: [Next](@next)
