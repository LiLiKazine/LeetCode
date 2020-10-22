//: [Previous](@previous)

/*
 
 763. Partition Labels
 
 A string S of lowercase English letters is given. We want to partition this string into as many parts as possible so that each letter appears in at most one part, and return a list of integers representing the size of these parts.

  

 Example 1:

 Input: S = "ababcbacadefegdehijhklij"
 Output: [9,7,8]
 Explanation:
 The partition is "ababcbaca", "defegde", "hijhklij".
 This is a partition so that each letter appears in at most one part.
 A partition like "ababcbacadefegde", "hijhklij" is incorrect, because it splits S into less parts.
  

 Note:

 S will have length in range [1, 500].
 S will consist of lowercase English letters ('a' to 'z') only.
 
 */

class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        var temp = [[Int]](), ans = [Int]()
        for ascii in Character("a").asciiValue! ... Character("z").asciiValue! {
            let c = Character(UnicodeScalar(ascii))
            if let first = Array(S).firstIndex(of: c) , let last = Array(S).lastIndex(of: c) {
                temp.append([first, last])
            }
        }
        temp.sort { (arr1, arr2) -> Bool in
            return arr1[0] < arr2[0]
        }
        temp = temp.reduce([[Int]]()) { (res, arr) -> [[Int]] in
            guard var lastArr = res.last else {
                return [arr]
            }
            if lastArr[1] < arr[0] {
                return res + [arr]
            }
            if lastArr[1] < arr[1] {
                lastArr[1] = arr[1]
                return res[res.startIndex..<res.index(before: res.endIndex)] + [lastArr]
            }
            return res
        }
        ans = temp.map{ $0[1] - $0[0] + 1 }
        return ans
    }
}

let S = "ababcbacadefegdehijhklij"
let solution = Solution()
let ans = solution.partitionLabels(S)

ans
//: [Next](@next)
