//: [Previous](@previous)

/*
 
 354. Russian Doll Envelopes
 
 You have a number of envelopes with widths and heights given as a pair of integers (w, h). One envelope can fit into another if and only if both the width and height of one envelope is greater than the width and height of the other envelope.

 What is the maximum number of envelopes can you Russian doll? (put one inside other)

 Note:
 Rotation is not allowed.

 Example:

 Input: [[5,4],[6,4],[6,7],[2,3]]
 Output: 3
 Explanation: The maximum number of envelopes you can Russian doll is 3 ([2,3] => [5,4] => [6,7]).
 
 */

class Solution {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        guard envelopes.count > 0 else {
            return 0
        }
        
        var envelopes = envelopes.sorted { (e1, e2) -> Bool in
            return e1[0] < e2[0] || (e1[0] == e2[0] && e1[1] > e2[1])
        },
        arr: [Int] = Array(repeating: 1, count: envelopes.count),
        ans = 1
        for i in 1..<envelopes.count {
            for j in 0..<i {
                if envelopes[i][1] > envelopes[j][1] {
                    arr[i] = max(arr[i], arr[j] + 1)
                }
            }
        }
        for n in arr {
            ans = max(ans, n)
        }
        return ans
    }
}

let envelopes = [[5,4],[6,4],[6,7],[2,3]]
let solution = Solution()
let ans = solution.maxEnvelopes(envelopes)
ans

//: [Next](@next)
