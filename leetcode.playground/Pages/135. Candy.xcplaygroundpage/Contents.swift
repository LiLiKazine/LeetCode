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
        return greedy(ratings)
    }
    
    func exceeded(_ ratings: [Int]) -> Int {
        var cache: [Int: Int] = [:]
        for i in 0..<ratings.count {
            if i == 0 {
                cache[i] = 1
                continue
            }
            if ratings[i] > ratings[i-1] {
                cache[i] = cache[i-1]! + 1
            } else if ratings[i] <= ratings[i-1] {
                if cache[i-1]! <= 1 && ratings[i] != ratings[i-1] {
                    raise(ratings, cache: &cache, tail: i)
                }
                cache[i] = 1
            }
            print(i, cache)
        }
        let vals = cache.values
        print(vals)
        let sum = vals.reduce(0, +)
        return sum
    }
    
    func raise(_ ratings: [Int], cache: inout [Int: Int], tail: Int) {
        for i in stride(from: tail-1, through: 0, by: -1) {
            cache[i]! += 1
            if i == 0 || ratings[i] >= ratings[i-1] || cache[i]! < cache[i-1]! {
                break
            }
        }
    }
    
    func brute(_ ratings: [Int]) -> Int {
        var temp = Array(repeating: 1, count: ratings.count)
        var flag = true
        while flag {
            flag = false
            for i in 0..<ratings.count {
                if i > 0 && ratings[i] > ratings[i-1] && temp[i] <= temp[i-1] {
                    temp[i] = temp[i-1] + 1
                    flag = true
                }
                if i + 1 < ratings.count && ratings[i] > ratings[i+1] && temp[i] <= temp[i+1] {
                    temp[i] = temp[i+1] + 1
                    flag = true
                }
            }
        }
        return temp.reduce(0, +)
    }
    
    func greedy(_ ratings: [Int]) -> Int {
        var left = Array(repeating: 1, count: ratings.count)
        var right = Array(repeating: 1, count: ratings.count)
        for i in 0..<ratings.count {
            if i > 0 && ratings[i] > ratings[i-1] {
                left[i] = left[i-1] + 1
            }
        }
        for i in stride(from: ratings.count-1, through: 0, by: -1) {
            if i + 1 < ratings.count && ratings[i] > ratings[i+1] {
                right[i] = right[i+1] + 1
            }
        }
//        print(left, right)
        for i in 0..<ratings.count {
            left[i] = max(left[i], right[i])
        }
//        print(left)
        return left.reduce(0, +)
    }
}

let solution = Solution()
let res = solution.candy([1,0,2])
res
//: [Next](@next)
