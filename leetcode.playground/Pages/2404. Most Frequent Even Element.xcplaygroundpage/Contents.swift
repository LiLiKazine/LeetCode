//: [Previous](@previous)

/*
 
 2404. Most Frequent Even Element
 
 Given an integer array nums, return the most frequent even element.

 If there is a tie, return the smallest one. If there is no such element, return -1.

  

 Example 1:

 Input: nums = [0,1,2,2,4,4,1]
 Output: 2
 Explanation:
 The even elements are 0, 2, and 4. Of these, 2 and 4 appear the most.
 We return the smallest one, which is 2.
 Example 2:

 Input: nums = [4,4,4,9,2,4]
 Output: 4
 Explanation: 4 is the even element appears the most.
 Example 3:

 Input: nums = [29,47,21,41,13,37,25,7]
 Output: -1
 Explanation: There is no even element.
  

 Constraints:

 1 <= nums.length <= 2000
 0 <= nums[i] <= 105
 
 */

class Solution {
    func mostFrequentEven(_ nums: [Int]) -> Int {
        return nums.lazy
            .filter { $0 % 2 == 0 }
            .reduce([Int: Int]()) { partialResult, num in
                var dict = partialResult
                dict[num] = (dict[num] ?? 0) + 1
                return dict
            }
            .reduce((-1, 0)) { partialResult, element in
                let (key, value) = element
                if partialResult.0 < 0 || value > partialResult.1 || (value == partialResult.1 && key < partialResult.0) {
                    return element
                }
                return partialResult
            }.0
    }
}

let nums = [29,47,21,41,13,37,25,7]
//let nums = [4,4,4,9,2,4]
//let nums = [0,1,2,2,4,4,1]
let solution = Solution()
let ans = solution.mostFrequentEven(nums)

print(ans)

//: [Next](@next)
