//: [Previous](@previous)

/*
 
 1288. Remove Covered Intervals
 
 Given a list of intervals, remove all intervals that are covered by another interval in the list.

 Interval [a,b) is covered by interval [c,d) if and only if c <= a and b <= d.

 After doing so, return the number of remaining intervals.

  

 Example 1:

 Input: intervals = [[1,4],[3,6],[2,8]]
 Output: 2
 Explanation: Interval [3,6] is covered by [2,8], therefore it is removed.
 Example 2:

 Input: intervals = [[1,4],[2,3]]
 Output: 1
 Example 3:

 Input: intervals = [[0,10],[5,12]]
 Output: 2
 Example 4:

 Input: intervals = [[3,10],[4,10],[5,11]]
 Output: 2
 Example 5:

 Input: intervals = [[1,2],[1,4],[3,4]]
 Output: 1
  

 Constraints:

 1 <= intervals.length <= 1000
 intervals[i].length == 2
 0 <= intervals[i][0] < intervals[i][1] <= 10^5
 All the intervals are unique.
 
 */

/*
 
 方法一：贪心算法
 求解模式：
 贪心算法的思想是在每一步都选取最优的方案，从而得到全局最优解。

 典型的贪心算法拥有 O(NlogN) 的时间复杂度且包括两个步骤：

 解决如何排序输入数据。该步骤会消耗 O(NlogN) 的时间。并且可以直接通过排序或间接使用堆数据结构来完成，通常排序比堆使用要好，因为没有额外空间的使用。
 构造一个解决方案解析排序后的输入数据花费 O(N)。
 对于已经排序的输入数据，贪心算法只需要 O(N) 的时间复杂度。

 首先让我们思考如何对输入数据排序。显而易见的是对起始点进行排序，因为简化了我们的解析步骤。



 如果 end1 < end2，则它们不会完全覆盖，但是有一部分重叠。


 如果 end1 >= end2，则区间 2 覆盖区间 1。

 边界条件： 如何处理有相同起点的情况。

 上面的算法将出现问题，因为它无法区分下面两种情况。

 一个区间被另一个区间覆盖，如果我们只按照起点排序，则我们就不知道是哪个区间覆盖哪个区间，因此，我们还需要对终点进行排序。

 如果两个区间起点相同，则将终点较大的放在前面。

 这样，我们就能更好的实现解析。


 算法：

 对起点进行升序排序，如果起点相同，则对终点进行降序排序。
 初始化没有被覆盖的区间数：count=0。
 迭代排序后的区间并且比较终点大小。
 如果当前区间不被前一个区间覆盖 end > prev_end，则增加 count，指定当前区间为下一步的前一个区间。
 否则，当前区间被前一个区间覆盖，不做任何事情。
 返回 count。


 作者：LeetCode
 链接：https://leetcode-cn.com/problems/remove-covered-intervals/solution/shan-chu-bei-fu-gai-qu-jian-by-leetcode-2/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 class Solution {
   public int removeCoveredIntervals(int[][] intervals) {
     Arrays.sort(intervals, new Comparator<int[]>() {
       @Override
       public int compare(int[] o1, int[] o2) {
         // Sort by start point.
         // If two intervals share the same start point,
         // put the longer one to be the first.
         return o1[0] == o2[0] ? o2[1] - o1[1]: o1[0] - o2[0];
       }
     });

     int count = 0;
     int end, prev_end = 0;
     for (int[] curr : intervals) {
       end = curr[1];
       // if current interval is not covered
       // by the previous one
       if (prev_end < end) {
         ++count;
         prev_end = end;
       }
     }
     return count;
   }
 }

 作者：LeetCode
 链接：https://leetcode-cn.com/problems/remove-covered-intervals/solution/shan-chu-bei-fu-gai-qu-jian-by-leetcode-2/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        var ans = [[Int]]()
        for interval in intervals {
            var valid = true, i = 0
            while i < ans.count {
                let candidate = ans[i]
                if interval[0] <= candidate[0] && interval[1] >= candidate[1] {
                    ans.remove(at: i)
                } else if interval[0] >= candidate[0] && interval[1] <= candidate[1] {
                    valid = false
                    break
                } else {
                    i += 1
                }
            }
            
            if valid {
                ans.append(interval)
            }
        }
        return ans.count
    }
}

let intervals = [[3,10],[4,10],[5,11]]
let solution = Solution()
let ans = solution.removeCoveredIntervals(intervals)
ans

//: [Next](@next)
