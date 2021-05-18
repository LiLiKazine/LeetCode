//: [Previous](@previous)

/*
 
 1442. Count Triplets That Can Form Two Arrays of Equal XOR
 
 Given an array of integers arr.

 We want to select three indices i, j and k where (0 <= i < j <= k < arr.length).

 Let's define a and b as follows:

 a = arr[i] ^ arr[i + 1] ^ ... ^ arr[j - 1]
 b = arr[j] ^ arr[j + 1] ^ ... ^ arr[k]
 Note that ^ denotes the bitwise-xor operation.

 Return the number of triplets (i, j and k) Where a == b.

  

 Example 1:

 Input: arr = [2,3,1,6,7]
 Output: 4
 Explanation: The triplets are (0,1,2), (0,2,2), (2,3,4) and (2,4,4)
 Example 2:

 Input: arr = [1,1,1,1,1]
 Output: 10
 Example 3:

 Input: arr = [2,3]
 Output: 0
 Example 4:

 Input: arr = [1,3,5,7,9]
 Output: 3
 Example 5:

 Input: arr = [7,11,12,9,5,2,7,17,22]
 Output: 8
  

 Constraints:

 1 <= arr.length <= 300
 1 <= arr[i] <= 10^8
 
 */
/*
 a = xj ^ xi
 b = xk ^ xj
 
 */
class Solution {
    func countTriplets(_ arr: [Int]) -> Int {
        let xorSums: [Int] = arr.reduce([0]) { (res, val) -> [Int] in
            return res + [(res.last!) ^ val]
        }
        var ans: Int = 0
        for i in 0..<arr.count {
            for k in i + 1..<arr.count {
                if xorSums[i] == xorSums[k + 1] {
                    ans += k - i
                }
            }
        }
        return ans
    }
}

let arr = [7,11,12,9,5,2,7,17,22]
let solution = Solution()
let ans = solution.countTriplets(arr)
ans

//: [Next](@next)
