//: [Previous](@previous)

/*
 
 135. Candy
 
 There are N children standing in a line. Each child is assigned a rating value.

 You are giving candies to these children subjected to the following requirements:

 Each child must have at least one candy.
 Children with a higher rating get more candies than their neighbors.
 What is the minimum candies you must give?

 Example 1:

 Input: [1,0,2]
 Output: 5
 Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
 Example 2:

 Input: [1,2,2]
 Output: 4
 Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
              The third child gets 1 candy because it satisfies the above two conditions.

 
 */

class Solution {
    func candy(_ ratings: [Int]) -> Int {
        guard ratings.count > 1 else { return ratings.count }
        
        var left = Array(repeating: 1, count: ratings.count)
        for i in 1..<ratings.count {
            let rating = ratings[i]
            if rating > ratings[i-1] {
                left[i] = left[i-1] + 1
            } else {
                left[i] = 1
            }
        }
        var ans = left.last!
        var lastNum = 1, lastRating = ratings.last!
        for i in stride(from: ratings.count - 2, through: 0, by: -1) {
            if ratings[i] > lastRating {
                lastNum += 1
            } else {
                lastNum = 1
            }
            lastRating = ratings[i]
            ans += max(left[i], lastNum)
        }
        return ans
    }
 }

let solution = Solution()
let res = solution.candy([1,0,2])
res
//: [Next](@next)
