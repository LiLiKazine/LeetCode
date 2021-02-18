//: [Previous](@previous)

/*
 
 765. Couples Holding Hands
 
 N couples sit in 2N seats arranged in a row and want to hold hands. We want to know the minimum number of swaps so that every couple is sitting side by side. A swap consists of choosing any two people, then they stand up and switch seats.

 The people and seats are represented by an integer from 0 to 2N-1, the couples are numbered in order, the first couple being (0, 1), the second couple being (2, 3), and so on with the last couple being (2N-2, 2N-1).

 The couples' initial seating is given by row[i] being the value of the person who is initially sitting in the i-th seat.

 Example 1:

 Input: row = [0, 2, 1, 3]
 Output: 1
 Explanation: We only need to swap the second (row[1]) and third (row[2]) person.
 Example 2:

 Input: row = [3, 2, 0, 1]
 Output: 0
 Explanation: All couples are already seated side by side.
 Note:

 len(row) is even and in the range of [4, 60].
 row is guaranteed to be a permutation of 0...len(row)-1.
 
 */

class Solution {
    func minSwapsCouples(_ row: [Int]) -> Int {
        let union = Union(row.count)
        for i in stride(from: 0, to: row.count, by: +2) {
            let v1 = row[i], v2 = row[i + 1]
            union.unit(v1, v2)
            union.unit(i, i + 1)
        }

        return row.count / 2 - union.count
    }
    
    private class Union {
        private(set) var union: [Int]
        private(set) var count: Int
        
        init(_ n: Int) {
            union = Array(0..<n)
            count = n
        }
        
        func find(_ i: Int) -> Int {
            if union[i] != i {
                union[i] = find(union[i])
            }
            return union[i]
        }
        
        
        func unit(_ i1: Int, _ i2: Int) {
            if find(i1) != find(i2) {
                union[find(i1)] = find(i2)
                count -= 1
            }
        }
    }
    
}

let row = [3, 2, 0, 1]
//let row = [0, 2, 1, 3]
let solution = Solution()
let ans = solution.minSwapsCouples(row)
ans

//: [Next](@next)
