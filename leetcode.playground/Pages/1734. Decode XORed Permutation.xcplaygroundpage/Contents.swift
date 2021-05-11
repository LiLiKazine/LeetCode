//: [Previous](@previous)

/*
 
 1734. Decode XORed Permutation
 
 There is an integer array perm that is a permutation of the first n positive integers, where n is always odd.

 It was encoded into another integer array encoded of length n - 1, such that encoded[i] = perm[i] XOR perm[i + 1]. For example, if perm = [1,3,2], then encoded = [2,1].

 Given the encoded array, return the original array perm. It is guaranteed that the answer exists and is unique.

  

 Example 1:

 Input: encoded = [3,1]
 Output: [1,2,3]
 Explanation: If perm = [1,2,3], then encoded = [1 XOR 2,2 XOR 3] = [3,1]
 Example 2:

 Input: encoded = [6,5,4,6]
 Output: [2,4,1,5,3]
  

 Constraints:

 3 <= n < 105
 n is odd.
 encoded.length == n - 1
 
 */

class Solution {
    func decode(_ encoded: [Int]) -> [Int] {
        let n = encoded.count + 1
        let totalXOR = Array(1...n).reduce(0) { (result, n) -> Int in
            return result ^ n
        }
        let subXOR = encoded.enumerated().reduce(0) { (result, enu) -> Int in
            let (index, n) = enu
            if index % 2 == 0 {
                return result ^ n
            }
            return result
        }
        var last = totalXOR ^ subXOR
        var ans: [Int] = [last]
        for n in encoded.reversed() {
            let val = n ^ last
            ans.insert(val, at: 0)
            last = val
        }
        return ans
    }
}

let encoded = [6,5,4,6]
let solution = Solution()
let ans = solution.decode(encoded)
ans

//: [Next](@next)
