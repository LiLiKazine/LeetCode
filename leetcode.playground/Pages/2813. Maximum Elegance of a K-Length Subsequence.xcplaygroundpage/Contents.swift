//: [Previous](@previous)

/*
 2813. Maximum Elegance of a K-Length Subsequence
 困难
 You are given a 0-indexed 2D integer array items of length n and an integer k.

 items[i] = [profiti, categoryi], where profiti and categoryi denote the profit and category of the ith item respectively.

 Let's define the elegance of a subsequence of items as total_profit + distinct_categories2, where total_profit is the sum of all profits in the subsequence, and distinct_categories is the number of distinct categories from all the categories in the selected subsequence.

 Your task is to find the maximum elegance from all subsequences of size k in items.

 Return an integer denoting the maximum elegance of a subsequence of items with size exactly k.

 Note: A subsequence of an array is a new array generated from the original array by deleting some elements (possibly none) without changing the remaining elements' relative order.

  

 Example 1:

 Input: items = [[3,2],[5,1],[10,1]], k = 2
 Output: 17
 Explanation: In this example, we have to select a subsequence of size 2.
 We can select items[0] = [3,2] and items[2] = [10,1].
 The total profit in this subsequence is 3 + 10 = 13, and the subsequence contains 2 distinct categories [2,1].
 Hence, the elegance is 13 + 22 = 17, and we can show that it is the maximum achievable elegance.
 Example 2:

 Input: items = [[3,1],[3,1],[2,2],[5,3]], k = 3
 Output: 19
 Explanation: In this example, we have to select a subsequence of size 3.
 We can select items[0] = [3,1], items[2] = [2,2], and items[3] = [5,3].
 The total profit in this subsequence is 3 + 2 + 5 = 10, and the subsequence contains 3 distinct categories [1,2,3].
 Hence, the elegance is 10 + 32 = 19, and we can show that it is the maximum achievable elegance.
 Example 3:

 Input: items = [[1,1],[2,1],[3,1]], k = 3
 Output: 7
 Explanation: In this example, we have to select a subsequence of size 3.
 We should select all the items.
 The total profit will be 1 + 2 + 3 = 6, and the subsequence contains 1 distinct category [1].
 Hence, the maximum elegance is 6 + 12 = 7.
  

 Constraints:

 1 <= items.length == n <= 105
 items[i].length == 2
 items[i][0] == profiti
 items[i][1] == categoryi
 1 <= profiti <= 109
 1 <= categoryi <= n
 1 <= k <= n
 
 */

import Foundation

class Solution {
    func findMaximumElegance(_ items: [[Int]], _ k: Int) -> Int {
        let items = items.sorted { a, b in
            return a[0] >= b[0]
        }
        var ans = 0
        var sum = 0
        var categories = Set<Int>()
        var stack = [Int]()
        for (i, item) in items.enumerated() {
            let profit = item[0], category = item[1]
            if i < k {
                sum += profit
                if !categories.insert(category).inserted {
                    stack.append(profit)
                }
            } else if stack.count > 0 && categories.insert(category).inserted {
                sum = sum + profit - stack.popLast()!
            }
            ans = max(ans, sum + square(of: categories.count))
        }
        return ans
    }
             
    func square(of value: Int) -> Int {
        return value * value
    }
}

/*
class Solution {
    
    var ans = 0
    var sum = 0
    var len = 0
    var categories = [Int: Int]()
    var distinct = 0
    
    func findMaximumElegance(_ items: [[Int]], _ k: Int) -> Int {
        find(items, k, 0)
        
        return ans
    }
    
    func find(_ items: [[Int]], _ k: Int, _ i: Int) {
        
        guard i < items.count else { return }
        guard items.count - i + len >= k else { return }
        
        let item = items[i]
        let profit = item[0], category = item[1]
        sum += profit
        if let cnt = categories[category], cnt > 0 {
            categories[category] = cnt + 1
        } else {
            categories[category] = categories[category, default: 0] + 1
            distinct += 1
        }
        
        len += 1
        if len == k {
//            let cnt = distinctCategories()
            ans = max(ans, sum + distinct * distinct)
        }
        if len < k {
            find(items, k, i + 1)
        }
        sum -= profit
        categories[category] = categories[category, default: 0] - 1
        if categories[category, default: 0] == 0 {
            distinct -= 1
        }
        len -= 1
        find(items, k, i + 1)
    }
    
    
    func distinctCategories() -> Int {
        var ans = 0
        for (_, value) in categories {
            guard value > 0 else { continue }
            ans += 1
        }
        return ans
    }
}
 */

//: [Next](@next)
