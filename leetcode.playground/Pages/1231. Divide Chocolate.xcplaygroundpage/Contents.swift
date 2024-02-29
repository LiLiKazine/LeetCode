//: [Previous](@previous)

/*
 1231. Divide Chocolate
 困难
 You have one chocolate bar that consists of some chunks. Each chunk has its own sweetness given by the array sweetness.

 You want to share the chocolate with your k friends so you start cutting the chocolate bar into k + 1 pieces using k cuts, each piece consists of some consecutive chunks.

 Being generous, you will eat the piece with the minimum total sweetness and give the other pieces to your friends.

 Find the maximum total sweetness of the piece you can get by cutting the chocolate bar optimally.

  

 Example 1:

 Input: sweetness = [1,2,3,4,5,6,7,8,9], k = 5
 Output: 6
 Explanation: You can divide the chocolate to [1,2,3], [4,5], [6], [7], [8], [9]
 Example 2:

 Input: sweetness = [5,6,7,8,9,1,2,3,4], k = 8
 Output: 1
 Explanation: There is only one way to cut the bar into 9 pieces.
 Example 3:

 Input: sweetness = [1,2,2,1,2,2,1,2,2], k = 2
 Output: 5
 Explanation: You can divide the chocolate to [1,2,2], [1,2,2], [1,2,2]
  

 Constraints:

 0 <= k < sweetness.length <= 104
 1 <= sweetness[i] <= 105
 
 */

import Foundation

class Solution {
    func maximizeSweetness(_ sweetness: [Int], _ k: Int) -> Int {
        
        var left = sweetness.min()!, right = sweetness.reduce(0, +) / (k + 1)
        
        while left < right {
            let mid = (left + right + 1) / 2
            
            var cur = 0
            var peopleWithChocolate = 0
            
            for sweet in sweetness {
                cur += sweet
                if cur >= mid {
                    cur = 0
                    peopleWithChocolate += 1
                }
            }
            if peopleWithChocolate >= k + 1 {
                left = mid
            } else {
                right = mid - 1
            }
        }
        return right
    }
}

/*
 class Solution {
     public int maximizeSweetness(int[] sweetness, int k) {
         // 初始化左右边界。
         // left = 1 并且 right = total 甜度 / number of people.
         int numberOfPeople = k + 1;
         int left = Arrays.stream(sweetness).min().getAsInt();
         int right = Arrays.stream(sweetness).sum() / numberOfPeople;

         while (left < right) {
             // 获取左右边界之前的中间值索引。
             // cur_sweetness 表示当前人的总甜度。
             // people_with_chocolate 表示有一块巧克力甜度大于等于 mid 的人数。
             int mid = (left + right + 1) / 2;
             int curSweetness = 0;
             int peopleWithChocolate = 0;
             
             // 开始为当前人分配块。
             for (int s : sweetness) {
                 curSweetness += s;
                 
                 // 当他的总甜度不小于 mid，说明我们
                 // 已经结束了对他的分配，继续处理下一个人
                 if (curSweetness >= mid) {
                     peopleWithChocolate += 1;
                     curSweetness = 0;
                 }
             }
             
             // 检查我们是否成功给了每个人一块甜度不小于 mid 的巧克力
             // 并且缩小一半搜索范围。
             if (peopleWithChocolate >= numberOfPeople) {
                 left = mid;
             } else {
                 right = mid - 1;
             }
         }
         
         // 一旦左右边界相遇，我们找到了目标值
         // 就是我们能够得到的最大甜度。
         return right;
     }
 }

 作者：力扣官方题解
 链接：https://leetcode.cn/problems/divide-chocolate/solutions/2419970/fen-xiang-qiao-ke-li-by-leetcode-solutio-yzf7/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
//: [Next](@next)
