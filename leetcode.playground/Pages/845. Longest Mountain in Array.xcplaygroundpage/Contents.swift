//: [Previous](@previous)

/*
 
 845. Longest Mountain in Array
 
 Let's call any (contiguous) subarray B (of A) a mountain if the following properties hold:

 B.length >= 3
 There exists some 0 < i < B.length - 1 such that B[0] < B[1] < ... B[i-1] < B[i] > B[i+1] > ... > B[B.length - 1]
 (Note that B could be any subarray of A, including the entire array A.)

 Given an array A of integers, return the length of the longest mountain.

 Return 0 if there is no mountain.

 Example 1:

 Input: [2,1,4,7,3,2,5]
 Output: 5
 Explanation: The largest mountain is [1,4,7,3,2] which has length 5.
 Example 2:

 Input: [2,2,2]
 Output: 0
 Explanation: There is no mountain.
 Note:

 0 <= A.length <= 10000
 0 <= A[i] <= 10000
 Follow up:

 Can you solve it using only one pass?
 Can you solve it in O(1) space?
 
 */

/*
 
 public int longestMountain(int[] A) {
        int n = A.length;
        if (n == 0) {
            return 0;
        }
        int[] left = new int[n];
        for (int i = 1; i < n; ++i) {
            left[i] = A[i - 1] < A[i] ? left[i - 1] + 1 : 0;
        }
        int[] right = new int[n];
        for (int i = n - 2; i >= 0; --i) {
            right[i] = A[i + 1] < A[i] ? right[i + 1] + 1 : 0;
        }

        int ans = 0;
        for (int i = 0; i < n; ++i) {
            if (left[i] > 0 && right[i] > 0) {
                ans = Math.max(ans, left[i] + right[i] + 1);
            }
        }
        return ans;
    }

作者：LeetCode-Solution
链接：https://leetcode-cn.com/problems/longest-mountain-in-array/solution/shu-zu-zhong-de-zui-chang-shan-mai-by-leetcode-sol/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func longestMountain(_ A: [Int]) -> Int {
        let n = A.count;
        if (n == 0) {
            return 0;
        }
        var left = Array(repeating: 0, count: n)
        for i in 1..<n {
            left[i] = A[i - 1] < A[i] ? left[i - 1] + 1 : 0;
        }
        var right = Array(repeating: 0, count: n)
        for i in stride(from: n-2, to: 0, by: -1) {
            right[i] = A[i + 1] < A[i] ? right[i + 1] + 1 : 0;
        }
        var ans = 0;
        for i in 0..<n {
            if (left[i] > 0 && right[i] > 0) {
                ans = max(ans, left[i] + right[i] + 1);
            }
        }
        return ans;
    }
}

let A = [2,3,3,2,0,2]

let solution = Solution()
let ans = solution.longestMountain(A)
ans

//: [Next](@next)
