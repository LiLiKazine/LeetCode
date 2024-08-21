//: [Previous](@previous)

/*
 3007. Maximum Number That Sum of the Prices Is Less Than or Equal to K
 中等
 You are given an integer k and an integer x. The price of a number num is calculated by the count of
 set bits
  at positions x, 2x, 3x, etc., in its binary representation, starting from the least significant bit. The following table contains examples of how price is calculated.

 x    num    Binary Representation    Price
 1    13    000001101    3
 2    13    000001101    1
 2    233    011101001    3
 3    13    000001101    1
 3    362    101101010    2
 The accumulated price of num is the total price of numbers from 1 to num. num is considered cheap if its accumulated price is less than or equal to k.

 Return the greatest cheap number.

  

 Example 1:

 Input: k = 9, x = 1

 Output: 6

 Explanation:

 As shown in the table below, 6 is the greatest cheap number.

 x    num    Binary Representation    Price    Accumulated Price
 1    1    001    1    1
 1    2    010    1    2
 1    3    011    2    4
 1    4    100    1    5
 1    5    101    2    7
 1    6    110    2    9
 1    7    111    3    12
 Example 2:

 Input: k = 7, x = 2

 Output: 9

 Explanation:

 As shown in the table below, 9 is the greatest cheap number.

 x    num    Binary Representation    Price    Accumulated Price
 2    1    0001    0    0
 2    2    0010    1    1
 2    3    0011    1    2
 2    4    0100    0    2
 2    5    0101    0    2
 2    6    0110    1    3
 2    7    0111    1    4
 2    8    1000    1    5
 2    9    1001    1    6
 2    10    1010    2    8
  

 Constraints:

 1 <= k <= 1015
 1 <= x <= 8

 */

import Foundation

/*
 class Solution {
     public long findMaximumNumber(long k, int x) {
         this.x = x;
         // 开区间二分，原理见 https://www.bilibili.com/video/BV1AP41137w7/
         long left = 0;
         long right = (k + 1) << x;
         while (left + 1 < right) {
             long mid = (left + right) >>> 1;
             if (countDigitOne(mid) <= k) {
                 left = mid;
             } else {
                 right = mid;
             }
         }
         return left;
     }

     private int x;
     private long num;
     private long memo[][];

     private long countDigitOne(long num) {
         this.num = num;
         int m = 64 - Long.numberOfLeadingZeros(num);
         memo = new long[m][m + 1];
         for (long[] row : memo) {
             Arrays.fill(row, -1);
         }
         return dfs(m - 1, 0, true);
     }

     private long dfs(int i, int cnt1, boolean isLimit) {
         if (i < 0) {
             return cnt1;
         }
         if (!isLimit && memo[i][cnt1] != -1) {
             return memo[i][cnt1];
         }
         int up = isLimit ? (int) (num >> i & 1) : 1;
         long res = 0;
         for (int d = 0; d <= up; d++) { // 枚举要填入的数字 d
             res += dfs(i - 1, cnt1 + (d == 1 && (i + 1) % x == 0 ? 1 : 0), isLimit && d == up);
         }
         if (!isLimit) {
             memo[i][cnt1] = res;
         }
         return res;
     }
 }
 */

class Solution {
    
    var accumulated = [Int: Int]()
    var priced = [Int: Int]()
    
    func findMaximumNumber(_ k: Int, _ x: Int) -> Int {
        var l = 1, r = k, ans = 0
        while l <= r {
            var mid = l + (r - l) / 2
            // print(l, mid, r)
            let sum = accumulate(of: mid, x)
            if sum > k {
                r = mid
            } else if sum == k {
                return mid
            } else {
                ans = max(mid, ans)
                l = mid + 1
            }
        }
        
        return ans
    }
    
    func accumulate(of num: Int, _ x: Int) -> Int {
        if num <= 0 { return  0 }
        if let value = accumulated[num] {
            return value
        }
        let ans = price(of: num, x) + accumulate(of: num - 1, x)
        accumulated[num] = ans
        return ans
    }
    
    func price(of num: Int, _ x: Int) -> Int {
        if num <= 0 { return 0 }
        if let value = priced[num] {
            return value
        }
        var ans = 0
        let binary = Array(String(num, radix: 2))
        for i in stride(from: x-1, to: binary.count, by: +x) {
            let n = Int(String(binary[i]))!
            ans += n
        }
        priced[num] = ans
        return ans
    }
}

//: [Next](@next)
