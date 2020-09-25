//: [Previous](@previous)

/*
 
 947. Most Stones Removed with Same Row or Column
 
 On a 2D plane, we place stones at some integer coordinate points.  Each coordinate point may have at most one stone.

 Now, a move consists of removing a stone that shares a column or row with another stone on the grid.

 What is the largest possible number of moves we can make?

 
 我们将石头放置在二维平面中的一些整数坐标点上。每个坐标点上最多只能有一块石头。

 每次 move 操作都会移除一块所在行或者列上有其他石头存在的石头。

 请你设计一个算法，计算最多能执行多少次 move 操作？
  

 Example 1:

 Input: stones = [[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]   1 1 0
                                                         1 0 1
                                                         0 1 1
 Output: 5
 Example 2:

 Input: stones = [[0,0],[0,2],[1,1],[2,0],[2,2]]
 Output: 3
 Example 3:

 Input: stones = [[0,0]]
 Output: 0
  

 Note:

 1 <= stones.length <= 1000
 0 <= stones[i][j] < 10000
 
 */

/*
 
 方法一： 深度优先搜索
 思路

 首先将处于同一行或同一列的石头两两相连，这样会产生一个图。在这个图里面，互相连通的石子组成一个连通分量。

 显然，总有办法将一个连通分量中的石子依次移除，直到只剩下一个。首先，我们要知道每个石子都属于一个连通分量，同时在一个连通分量中移除石子不会影响到其他的连通分量。在有了这个前提之下，我们可以推断出，如果把连通分量作为一个生成树来看，每次都移除树中的叶子节点，重复这个操作，最后就只会剩下一个根节点。

 算法

 在这里我们用深度优先搜索来计算图中的连通分量的个数，通过深度优先搜索遍历连通分量中的每个节点。在每个连通分量里面，最多能移除石子的数量为 连通分量中石子数量 - 1。

 JavaPython

 class Solution {
     public int removeStones(int[][] stones) {
         int N = stones.length;

         // graph[i][0] = the length of the 'list' graph[i][1:]
         int[][] graph = new int[N][N];
         for (int i = 0; i < N; ++i)
             for (int j = i+1; j < N; ++j)
                 if (stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1]) {
                     graph[i][++graph[i][0]] = j;
                     graph[j][++graph[j][0]] = i;
                 }

         int ans = 0;
         boolean[] seen = new boolean[N];
         for (int i = 0; i < N; ++i) if (!seen[i]) {
             Stack<Integer> stack = new Stack();
             stack.push(i);
             seen[i] = true;
             ans--;
             while (!stack.isEmpty()) {
                 int node = stack.pop();
                 ans++;
                 for (int k = 1; k <= graph[node][0]; ++k) {
                     int nei = graph[node][k];
                     if (!seen[nei]) {
                         stack.push(nei);
                         seen[nei] = true;
                     }
                 }
             }
         }

         return ans;
     }
 }
 复杂度分析

 时间复杂度： O(N^2)，其中 N 是石头的数量。

 空间复杂度： O(N^2)。

 方法二： 并查集
 思路

 在方法一中，我们通过深度优先搜索来计算隐式图中连通分量的个数。实际上有更高效的解决方法，那就是用并查集。

 算法

 对于一个坐标为 (i, j) 的石子来说，需要把行 i 和列 j 合并，因为并查集是一维的，用 j+10000 来代替 j。在将所有石子的行和列都合并好之后，只需数一下并查集中有几个集合就可以得到答案了。

 简洁起见，这里实现的并查集就不根据 rank 来合并了。因此渐进复杂度会比用 rank 的高一点。

 JavaPython

 class Solution {
     public int removeStones(int[][] stones) {
         int N = stones.length;
         DSU dsu = new DSU(20000);

         for (int[] stone: stones)
             dsu.union(stone[0], stone[1] + 10000);

         Set<Integer> seen = new HashSet();
         for (int[] stone: stones)
             seen.add(dsu.find(stone[0]));

         return N - seen.size();
     }
 }

 class DSU {
     int[] parent;
     public DSU(int N) {
         parent = new int[N];
         for (int i = 0; i < N; ++i)
             parent[i] = i;
     }
     public int find(int x) {
         if (parent[x] != x) parent[x] = find(parent[x]);
         return parent[x];
     }
     public void union(int x, int y) {
         parent[find(x)] = find(y);
     }
 }
 复杂度分析

 时间复杂度： O(NlogN)，其中 N 是 stones 的大小。（如果根据 rank 来做合并操作，时间复杂度就是 O(N∗α(N))，其中 α 是 Ackerman 函数的反函数。）

 空间复杂度： O(N)。

 作者：LeetCode
 链接：https://leetcode-cn.com/problems/most-stones-removed-with-same-row-or-column/solution/yi-chu-zui-duo-de-tong-xing-huo-tong-lie-shi-tou-b/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func removeStones(_ stones: [[Int]]) -> Int {
        return 0
    }
}

//: [Next](@next)
