//: [Previous](@previous)

/*
 1228. Missing Number In Arithmetic Progression
 简单
 In some array arr, the values were in arithmetic progression: the values arr[i + 1] - arr[i] are all equal for every 0 <= i < arr.length - 1.

 A value from arr was removed that was not the first or last value in the array.

 Given arr, return the removed value.

  

 Example 1:

 Input: arr = [5,7,11,13]
 Output: 9
 Explanation: The previous array was [5,7,9,11,13].
 Example 2:

 Input: arr = [15,13,12]
 Output: 14
 Explanation: The previous array was [15,14,13,12].
  

 Constraints:

 3 <= arr.length <= 1000
 0 <= arr[i] <= 105
 The given array is guaranteed to be a valid array.
 
 */

import Foundation

class Solution {
    func missingNumber(_ arr: [Int]) -> Int {
        let cnt = arr.count
        let k =  {
            if arr[0] > arr[cnt-1] {
                return max(arr[1] - arr[0], arr[cnt - 1] - arr[cnt - 2])
            } else {
                return min(arr[1] - arr[0], arr[cnt - 1] - arr[cnt - 2])
            }
        }()
        
        var low = 0, high = cnt - 1
        var ans = arr
        while low < high {
            let mid = low + (high - low) / 2
            let shouldBe = arr[0] + mid * k
            if arr[mid] == shouldBe {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return arr[0] + k * low
    }
}

/*
 class Solution {
    public int missingNumber(int arr[]) {
        int n = arr.length;

        // 1. 获取差值 `difference`.
        int difference = (arr[n - 1] - arr[0]) / n;
        int lo = 0;
        int hi = n - 1;

        // 二分查找模版。
        while (lo < hi) {
            int mid = (lo + hi) / 2;

            // 所有数字中没有遗漏的数字，所以在右边搜索。
            if (arr[mid] == arr[0] + mid * difference) {
                lo = mid + 1;
            }

            // ‘mid`前缺少一个数字，包括 `mid` 本身。
            else {
                hi = mid;
            }
        }

        // 索引 `lo` 将是第一个数字错误的位置。
        // 返回应该位于此索引处的值。
        return arr[0] + difference * lo;
    }
 }

 作者：力扣官方题解
 链接：https://leetcode.cn/problems/missing-number-in-arithmetic-progression/solutions/2392382/deng-chai-shu-lie-zhong-que-shi-de-shu-z-f1ug/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

//: [Next](@next)
