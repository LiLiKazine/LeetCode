//: [Previous](@previous)

/*
 
 973. K Closest Points to Origin
 
 We have a list of points on the plane.  Find the K closest points to the origin (0, 0).

 (Here, the distance between two points on a plane is the diction distance.)

 You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)

  

 Example 1:

 Input: points = [[1,3],[-2,2]], K = 1
 Output: [[-2,2]]
 Explanation:
 The distance between (1, 3) and the origin is sqrt(10).
 The distance between (-2, 2) and the origin is sqrt(8).
 Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
 We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].
 Example 2:

 Input: points = [[3,3],[5,-1],[-2,4]], K = 2
 Output: [[3,3],[-2,4]]
 (The answer [[-2,4],[3,3]] would also be accepted.)
  

 Note:

 1 <= K <= points.length <= 10000
 -10000 < points[i][0] < 10000
 -10000 < points[i][1] < 10000
 
 */

/*
 
 方法二：分治法
 思路

 我们想要一个复杂度比 NlogN 更低的算法。 显然，做到这件事情的唯一办法就是利用题目中可以按照任何顺序返回 K 个点的条件，否则的话，必要的排序将会话费我们 NlogN 的时间。

 我们随机地选择一个元素 x = A[i] 然后将数组分为两部分： 一部分是到原点距离小于 x 的，另一部分是到原点距离大于等于 x 的。 这个快速选择的过程与快速排序中选择一个关键元素将数组分为两部分的过程类似。

 如果我们快速选择一些关键元素，那么每次就可以将问题规模缩减为原来的一半，平均下来时间复杂度就是线性的。

 算法

 我们定义一个函数 work(i, j, K)，它的功能是部分排序 (points[i], points[i+1], ..., points[j]) 使得最小的 K 个元素出现在数组的首部，也就是 (i, i+1, ..., i+K-1)。

 首先，我们从数组中选择一个随机的元素作为关键元素，然后使用这个元素将数组分为上述的两部分。为了能使用线性时间的完成这件事，我们需要两个指针 i 与 j，然后将它们移动到放错了位置元素的地方，然后交换这些元素。

 然后，我们就有了两个部分 [oi, i] 与 [i+1, oj]，其中 (oi, oj) 是原来调用 work(i, j, K) 时候 (i, j) 的值。假设第一部分有 10 个元，第二部分有15 个元素。如果 K = 5 的话，我们只需要对第一部分调用 work(oi, i, 5)。否则的话，假如说 K = 17，那么第一部分的 10 个元素应该都需要被选择，我们只需要对第二部分调用 work(i+1, oj, 7) 就行了。


 import java.util.concurrent.ThreadLocalRandom;

 class Solution {
     int[][] points;
     public int[][] kClosest(int[][] points, int K) {
         this.points = points;
         work(0, points.length - 1, K);
         return Arrays.copyOfRange(points, 0, K);
     }

     public void work(int i, int j, int K) {
         if (i >= j) return;
         int oi = i, oj = j;
         int pivot = dist(ThreadLocalRandom.current().nextInt(i, j));

         while (i < j) {
             while (i < j && dist(i) < pivot) i++;
             while (i < j && dist(j) > pivot) j--;
             swap(i, j);
         }

         if (K <= i - oi + 1)
             work(oi, i, K);
         else
             work(i+1, oj, K - (i - oi + 1));
     }

     public int dist(int i) {
         return points[i][0] * points[i][0] + points[i][1] * points[i][1];
     }

     public void swap(int i, int j) {
         int t0 = points[i][0], t1 = points[i][1];
         points[i][0] = points[j][0];
         points[i][1] = points[j][1];
         points[j][0] = t0;
         points[j][1] = t1;
     }
 }
 复杂度分析

 时间复杂度：O(N)O(N) ，这是在平均情况下 的时间复杂度， 其中 NN 是给定点的数量。

 空间复杂度：O(N)O(N)。

 作者：LeetCode
 链接：https://leetcode-cn.com/problems/k-closest-points-to-origin/solution/zui-jie-jin-yuan-dian-de-k-ge-dian-by-leetcode/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */

import Darwin

class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        return divideNcouquer(points, K)
    }
    
    func divideNcouquer(_ points: [[Int]], _ K: Int) -> [[Int]] {
        guard points.count > K else {
            return points
        }
        var points = points, i = 0, j = points.count - 1, swaped = false
        while swaped {
            swaped = false
            let dis = distance(points[i])
            while i < j {
                while i < j && distance(points[i]) <= dis {
                    i += 1
                }
                while i < j && distance(points[j]) >= dis {
                    j -= 1
                }
                if i < j {
                    let temp = points[i]
                    points[i] = points[j]
                    points[j] = temp
                    swaped = true
                } else {
                    break
                }
            }
            if i < K - 1 {
                i += 1
                j = points.count - 1
            } else {
                i = 0
                j = i - 1
            }
        }
        return Array(points[0..<K])
    }
    
    func distance(_ point: [Int]) -> Double {
        let dis = sqrt(pow(abs(Double(point[0])), 2) + pow(abs(Double(point[1])), 2))
        return dis
    }
}
//[[0,1],[1,0]]
//2
//let points = [[-5,4],[-3,2],[0,1],[-3,7],[-2,0],[-4,-6],[0,-5]], K = 6
let points = [[-2,10],[-4,-8],[10,7],[-4,-7]],
K = 3
let solution = Solution()
let ans = solution.kClosest(points, K)
ans
//: [Next](@next)
