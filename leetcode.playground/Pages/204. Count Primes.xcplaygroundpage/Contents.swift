//: [Previous](@previous)

/*
 
 204. Count Primes
 
 Count the number of prime numbers less than a non-negative number, n.

  

 Example 1:

 Input: n = 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 Example 2:

 Input: n = 0
 Output: 0
 Example 3:

 Input: n = 1
 Output: 0
  

 Constraints:

 0 <= n <= 5 * 106
 
 */

class Solution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else {
            return 0
        }
        var arr = Array(repeating: 1, count: n), next = 2
        arr[0] = 0
        arr[1] = 0
        while next < n {
            var multi = 2, temp = next * multi
            while temp < n {
                arr[temp] = 0
                multi += 1
                temp = next * multi
            }
            let oldNext = next
            for i in next + 1 ..< n {
                if arr[i] == 1 {
                    next = i
                    break
                }
            }
            if next == oldNext {
                break
            }
            
        }
        let ans = arr.reduce(0, +)
        
        return ans
    }
}

let solution = Solution()
let ans = solution.countPrimes(10)

//: [Next](@next)
