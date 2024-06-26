//: [Previous](@previous)

/*
 
 503. Next Greater Element II
 
 Given a circular array (the next element of the last element is the first element of the array), print the Next Greater Number for every element. The Next Greater Number of a number x is the first greater number to its traversing-order next in the array, which means you could search circularly to find its next greater number. If it doesn't exist, output -1 for this number.

 Example 1:
 Input: [1,2,1]
 Output: [2,-1,2]
 Explanation: The first 1's next greater number is 2;
 The number 2 can't find next greater number;
 The second 1's next greater number needs to search circularly, which is also 2.
 Note: The length of given array won't exceed 10000.
 
 */

class Solution {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        let len = nums.count
        var ans = Array(repeating: -1, count: len)
        var stack = [Int]()
        for index in 0..<len*2-1 {
            let i = index % len
            let num = nums[i]
            while let last = stack.last, nums[last] < num {
                ans[last] = num
                stack.popLast()
            }
            stack.append(i)
        }
        return ans
    }
}

//: [Next](@next)
