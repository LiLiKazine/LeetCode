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
        var envelopes = envelopes.sorted { (e1, e2) -> Bool in
            return e1[0] < e2[0] || (e1[0] == e2[0] && e1[1] > e2[1])
        }
        var f = [envelopes[0][1]]
        for i in 1..<envelopes.count {
            let val = envelopes[i][1]
            if f.last! < val {
                f.append(val)
            } else {
                binarySearchInsert(&f, value: val)
            }
        }
        return f.count
    }
    
    func binarySearchInsert(_ f: inout [Int], value: Int) {
        var l = 0, r = f.count - 1
        while l < r {
            let mid = (r - l) / 2 + l
            if f[mid] == value {
                f[mid] = value
                return
            } else if f[mid] > value {
                r = mid
            } else {
                l = mid + 1
            }
        }
        if l == r {
            f[l] = value
        }
    }
}

let envelopes = [[5,4],[6,4],[6,7],[2,3]]
let solution = Solution()
let ans = solution.maxEnvelopes(envelopes)
ans

//: [Next](@next)
