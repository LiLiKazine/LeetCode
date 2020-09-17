//: [Previous](@previous)

/*
 
 887. Super Egg Drop
 
 You are given K eggs, and you have access to a building with N floors from 1 to N.

 Each egg is identical in function, and if an egg breaks, you cannot drop it again.

 You know that there exists a floor F with 0 <= F <= N such that any egg dropped at a floor higher than F will break, and any egg dropped at or below floor F will not break.

 Each move, you may take an egg (if you have an unbroken one) and drop it from any floor X (with 1 <= X <= N).

 Your goal is to know with certainty what the value of F is.

 What is the minimum number of moves that you need to know with certainty what F is, regardless of the initial value of F?

  

 Example 1:

 Input: K = 1, N = 2
 Output: 2
 Explanation:
 Drop the egg from floor 1.  If it breaks, we know with certainty that F = 0.
 Otherwise, drop the egg from floor 2.  If it breaks, we know with certainty that F = 1.
 If it didn't break, then we know with certainty F = 2.
 Hence, we needed 2 moves in the worst case to know what F is with certainty.
 Example 2:

 Input: K = 2, N = 6
 Output: 3
 Example 3:

 Input: K = 3, N = 14
 Output: 4
  

 Note:

 1 <= K <= 100
 1 <= N <= 10000
 
 */

/*
 
 📖 文字题解
 说明
 本题是谷歌的一道经典面试题。由于本题过于经典，谷歌公司已经不再将这题作为面试的候选题目了。

 本题难度较高，要想通过本题，需要一定的动态规划优化或数学功底。本题的标准解法为动态规划，由于篇幅有限，不会叙述 动态规划的边界条件、自底向上的动态规划和自顶向下的动态规划分别怎么实现 等较为基础的知识，而是把重点放在推导动态规划状态转移方程的过程，以及优化的思路、证明以及方法。

 读者应当期望在阅读完本题解后，能够对方法一有一个大致的思路，并且可以在尝试中编写出代码。方法一已经是很优秀的解法，本题解也着重于此。而对于方法二和方法三，已经超过了面试难度，是竞赛中的考点，仅供读者挑战自我的极限。

 方法一：动态规划 + 二分搜索
 思路和算法

 我们可以考虑使用动态规划来做这道题，状态可以表示成 (K, N)(K,N)，其中 KK 为鸡蛋数，NN 为楼层数。当我们从第 XX 楼扔鸡蛋的时候：

 如果鸡蛋不碎，那么状态变成 (K, N-X)(K,N−X)，即我们鸡蛋的数目不变，但答案只可能在上方的 N-XN−X 层楼了。也就是说，我们把原问题缩小成了一个规模为 (K, N-X)(K,N−X) 的子问题；

 如果鸡蛋碎了，那么状态变成 (K-1, X-1)(K−1,X−1)，即我们少了一个鸡蛋，但我们知道答案只可能在第 XX 楼下方的 X-1X−1 层楼中了。也就是说，我们把原问题缩小成了一个规模为 (K-1, X-1)(K−1,X−1) 的子问题。

 这样一来，我们定义 dp(K, N)dp(K,N) 为在状态 (K, N)(K,N) 下最少需要的步数。根据以上分析我们可以列出状态转移方程：

 dp(K, N) = 1 + \min\limits_{1 \leq X \leq N} \Big( \max(dp(K-1, X-1), dp(K, N-X)) \Big)
 dp(K,N)=1+
 1≤X≤N
 min
 ​    
  (max(dp(K−1,X−1),dp(K,N−X)))

 这个状态转移方程是如何得来的呢？对于 dp(K, N)dp(K,N) 而言，我们像上面分析的那样，枚举第一个鸡蛋扔在的楼层数 XX。由于我们并不知道真正的 FF 值，因此我们必须保证 鸡蛋碎了之后接下来需要的步数 和 鸡蛋没碎之后接下来需要的步数 二者的 最大值 最小，这样就保证了在 最坏情况下（也就是无论 FF 的值如何） dp(K, N)dp(K,N) 的值最小。如果能理解这一点，也就能理解上面的状态转移方程，即最小化 \max(dp(K-1, X-1), dp(K, N-X))max(dp(K−1,X−1),dp(K,N−X))。

 如果我们直接暴力转移求解每个状态的 dpdp 值，时间复杂度是为 O(KN^2)O(KN
 2
  )，即一共有 O(KN)O(KN) 个状态，对于每个状态枚举扔鸡蛋的楼层 XX，需要 O(N)O(N) 的时间。这无疑在当前数据范围下是会超出时间限制的，因此我们需要想办法优化枚举的时间复杂度。

 我们观察到 dp(K, N)dp(K,N) 是一个关于 NN 的单调递增函数，也就是说在鸡蛋数 KK 固定的情况下，楼层数 NN 越多，需要的步数一定不会变少。在上述的状态转移方程中，第一项 \mathcal{T_1}(X) = dp(K-1, X-1)T
 1
 ​    
  (X)=dp(K−1,X−1) 是一个随 XX 的增加而单调递增的函数，第二项 \mathcal{T_2}(X) = dp(K, N-X)T
 2
 ​    
  (X)=dp(K,N−X) 是一个随着 XX 的增加而单调递减的函数。

 这如何帮助我们来优化这个问题呢？当 XX 增加时，\mathcal{T_1}(X)T
 1
 ​    
  (X) 单调递增而 \mathcal{T_2}(X)T
 2
 ​    
  (X) 单调递减，我们可以想象在一个直角坐标系中，横坐标为 XX，纵坐标为 \mathcal{T_1}(X)T
 1
 ​    
  (X) 和 \mathcal{T_2}(X)T
 2
 ​    
  (X)。当一个函数单调递增而另一个函数单调递减时，我们如何找到一个位置使得它们的最大值最小呢？



 如上图所示，如果这两个函数都是连续函数，那么我们只需要找出这两个函数的交点，在交点处就能保证这两个函数的最大值最小。但在本题中，\mathcal{T_1}(X)T
 1
 ​    
  (X) 和 \mathcal{T_2}(X)T
 2
 ​    
  (X) 都是离散函数，也就是说，XX 的值只能取 1, 2, 31,2,3 等等。在这种情况下，我们需要找到最大的满足 \mathcal{T_1}(X) < \mathcal{T_2}(X)T
 1
 ​    
  (X)<T
 2
 ​    
  (X) 的 X_0X
 0
 ​    
  ，以及最小的满足 \mathcal{T_1}(X) \geq \mathcal{T_2}(X)T
 1
 ​    
  (X)≥T
 2
 ​    
  (X) 的 X_1X
 1
 ​    
  ，对应到上图中，就是离这两个函数（想象中的）交点左右两侧最近的整数。

 我们只需要比较在 X_0X
 0
 ​    
   和 X_1X
 1
 ​    
   处两个函数的最大值，取一个最小的作为 XX 即可。在数学上，我们可以证明出 X_0X
 0
 ​    
   和 X_1X
 1
 ​    
   相差 11，这也是比较显然的，因为它们正好夹住了那个想象中的交点，并且相距尽可能地近。因此我们就可以使用二分查找的方法找出 X_0X
 0
 ​    
  ，再得到 X_1X
 1
 ​    
  ：

 我们在所有满足条件的 XX 上进行二分查找。对于状态 (K, N)(K,N) 而言，XX 即为 [1, N][1,N] 中的任一整数；

 在二分查找的过程中，假设当前这一步我们查找到了 X_\textit{mid}X
 mid
 ​    
  ，如果 \mathcal{T_1}(X_\textit{mid}) > \mathcal{T_2}(X_\textit{mid})T
 1
 ​    
  (X
 mid
 ​    
  )>T
 2
 ​    
  (X
 mid
 ​    
  )，那么真正的 X_0X
 0
 ​    
   一定在 X_\textit{mid}X
 mid
 ​    
   的左侧，否则真正的 X_0X
 0
 ​    
   在 X_\textit{mid}X
 mid
 ​    
   的右侧。

 二分查找的写法因人而异，本质上我们就是需要找到最大的满足 \mathcal{T_1}(X) < \mathcal{T_2}(X)T
 1
 ​    
  (X)<T
 2
 ​    
  (X) 的 X_0X
 0
 ​    
  ，根据 X_\textit{mid}X
 mid
 ​    
   进行二分边界的调整。在得到了 X_0X
 0
 ​    
   后，我们可以知道 X_1X
 1
 ​    
   即为 X_0 + 1X
 0
 ​    
  +1，此时我们只需要比较 \max(\mathcal{T_1}(X_0), \mathcal{T_2}(X_0))max(T
 1
 ​    
  (X
 0
 ​    
  ),T
 2
 ​    
  (X
 0
 ​    
  )) 和 \max(\mathcal{T_1}(X_1), \mathcal{T_2}(X_1))max(T
 1
 ​    
  (X
 1
 ​    
  ),T
 2
 ​    
  (X
 1
 ​    
  ))，取较小的那个对应的位置作为 XX 即可。

 这样一来，对于给定的状态 (K, N)(K,N)，我们只需要 O(\log N)O(logN) 的时间，通过二分查找就能得到最优的那个 XX，因此时间复杂度从 O(KN^2)O(KN
 2
  ) 降低至 O(KN \log N)O(KNlogN)，可以通过本题。

 JavaPython3C++

 class Solution {
     public int superEggDrop(int K, int N) {
         return dp(K, N);
     }

     Map<Integer, Integer> memo = new HashMap();
     public int dp(int K, int N) {
         if (!memo.containsKey(N * 100 + K)) {
             int ans;
             if (N == 0)
                 ans = 0;
             else if (K == 1)
                 ans = N;
             else {
                 int lo = 1, hi = N;
                 while (lo + 1 < hi) {
                     int x = (lo + hi) / 2;
                     int t1 = dp(K-1, x-1);
                     int t2 = dp(K, N-x);

                     if (t1 < t2)
                         lo = x;
                     else if (t1 > t2)
                         hi = x;
                     else
                         lo = hi = x;
                 }

                 ans = 1 + Math.min(Math.max(dp(K-1, lo-1), dp(K, N-lo)),
                                    Math.max(dp(K-1, hi-1), dp(K, N-hi)));
             }

             memo.put(N * 100 + K, ans);
         }

         return memo.get(N * 100 + K);
     }
 }
 复杂度分析

 时间复杂度：O(K * N \log N)O(K∗NlogN)。我们需要计算 O(K * N)O(K∗N) 个状态，每个状态计算时需要 O(\log N)O(logN) 的时间进行二分搜索。

 空间复杂度：O(K * N)O(K∗N)。我们需要 O(K * N)O(K∗N) 的空间存储每个状态的解。

 方法二：决策单调性
 说明

 方法二涉及决策单调性，是竞赛中的考点。这里我们不会叙述 何为决策单调性 以及 如何根据决策单调性写出优化的动态规划，而是仅指出决策单调性的存在性。

 思路

 我们重新写下方法一中的状态转移方程：

 dp(K, N) = 1 + \min\limits_{1 \leq X \leq N} \Big( \max(dp(K-1, X-1), dp(K, N-X)) \Big)
 dp(K,N)=1+
 1≤X≤N
 min
 ​    
  (max(dp(K−1,X−1),dp(K,N−X)))

 并且假设 X_\textit{opt}X
 opt
 ​    
   是使得 dp(K, N)dp(K,N) 取到最优值的最小决策点 X_0X
 0
 ​    
  。

 X_\textit{opt} = \arg \min\limits_{1 \leq X \leq N} \Big( \max(dp(K-1, X-1), dp(K, N-X)) \Big)
 X
 opt
 ​    
  =arg
 1≤X≤N
 min
 ​    
  (max(dp(K−1,X−1),dp(K,N−X)))

 在方法一中，我们是通过二分查找的方法，找到 X_0X
 0
 ​    
   和 X_1X
 1
 ​    
   中最优的作为 X_\textit{opt}X
 opt
 ​    
   的，那么还有什么更好的方法吗？

 我们固定 KK，随着 NN 的增加，对于状态转移方程中 dp(K-1, X-1)dp(K−1,X−1) 这一项，它的值是不变的，因为它和 NN 无关。而对于状态转移方程中 dp(K, N-X)dp(K,N−X) 这一项，随着 NN 的增加，它的值也会增加。在方法一中，我们知道 dp(K-1, X-1)dp(K−1,X−1) 随着 XX 单调递增，而 dp(K, N-X)dp(K,N−X) 随着 XX 单调递减，那么当 NN 增加时，dp(K, N-X)dp(K,N−X) 对应的函数折线图在每个整数点上都是增加的，因此在 dp(K-1, X-1)dp(K−1,X−1) 不变的情况下，X_\textit{opt}X
 opt
 ​    
   是单调递增的。

 我们可以想象一条斜率为负的直线和一条斜率为正的直线，当斜率为负的直线（类比 dp(K, N-X)dp(K,N−X)）向上平移（类比 NN 的增加）时，它和斜率为正的直线（类比 dp(K-1, X-1)dp(K−1,X−1)）的交点会一直向右移动，这个交点就确定了 X_\textit{opt}X
 opt
 ​    
  ，这与方法一也是一致的。

 因此当我们固定 KK 时，随着 NN 的增加，dp(K, N)dp(K,N) 对应的最优解的坐标 X_\textit{opt}X
 opt
 ​    
   单调递增，这样一来每个 dp(K, N)dp(K,N) 的均摊时间复杂度为 O(1)O(1)。

 JavaPython3C++

 class Solution {
     public int superEggDrop(int K, int N) {
         // Right now, dp[i] represents dp(1, i)
         int[] dp = new int[N+1];
         for (int i = 0; i <= N; ++i)
             dp[i] = i;

         for (int k = 2; k <= K; ++k) {
             // Now, we will develop dp2[i] = dp(k, i)
             int[] dp2 = new int[N+1];
             int x = 1;
             for (int n = 1; n <= N; ++n) {
                 // Let's find dp2[n] = dp(k, n)
                 // Increase our optimal x while we can make our answer better.
                 // Notice max(dp[x-1], dp2[n-x]) > max(dp[x], dp2[n-x-1])
                 // is simply max(T1(x-1), T2(x-1)) > max(T1(x), T2(x)).
                 while (x < n && Math.max(dp[x-1], dp2[n-x]) > Math.max(dp[x], dp2[n-x-1]))
                     x++;

                 // The final answer happens at this x.
                 dp2[n] = 1 + Math.max(dp[x-1], dp2[n-x]);
             }

             dp = dp2;
         }

         return dp[N];
     }
 }
 复杂度分析

 时间复杂度：O(K * N)O(K∗N)。我们需要计算 O(K * N)O(K∗N) 个状态，同时对于每个 KK，最优解指针只会从 00 到 NN 走一次，复杂度也是 O(K * N)O(K∗N)。因此总体复杂度为 O(K * N)O(K∗N)。

 空间复杂度：O(N)O(N)。因为 dpdp 每一层的解只依赖于上一层的解，因此我们每次只保留一层的解，需要的空间复杂度为 O(N)O(N)。

 方法三：数学法
 说明

 方法三涉及逆向思维，是一种没见过就不太可能想出来，读过题解也很容易忘记的方法。

 思路

 反过来想这个问题：如果我们可以做 TT 次操作，而且有 KK 个鸡蛋，那么我们能找到答案的最高的 NN 是多少？我们设 f(T, K)f(T,K) 为在上述条件下的 NN。如果我们求出了所有的 f(T, K)f(T,K)，那么只需要找出最小的满足 f(T, K) \geq Nf(T,K)≥N 的 TT。

 那么我们如何求出 f(T, K)f(T,K) 呢？我们还是使用动态规划。因为我们需要找出最高的 NN，因此我们不必思考到底在哪里扔这个鸡蛋，我们只需要扔出一个鸡蛋，看看到底发生了什么：

 如果鸡蛋没有碎，那么对应的是 f(T - 1, K)f(T−1,K)，也就是说在这一层的上方可以有 f(T - 1, K)f(T−1,K) 层；

 如果鸡蛋碎了，那么对应的是 f(T - 1, K - 1)f(T−1,K−1)，也就是说在这一层的下方可以有 f(T - 1， K - 1)f(T−1，K−1) 层。

 因此我们就可以写出状态转移方程：

 f(T, K) = 1 + f(T-1, K-1) + f(T-1, K)
 f(T,K)=1+f(T−1,K−1)+f(T−1,K)

 边界条件为：当 T \geq 1T≥1 的时候 f(T, 1) = Tf(T,1)=T，当 K \geq 1K≥1 时，f(1, K) = 1f(1,K)=1。

 那么问题来了：TT 最大可以达到多少？由于我们在进行动态规划时，TT 在题目中并没有给出，那么我们需要进行到动态规划的哪一步呢？可以发现，操作次数是一定不会超过楼层数的，因此 T \leq NT≤N，我们只要算出在 f(N, K)f(N,K) 内的所有 ff 值即可。

 JavaPython3C++

 class Solution {
     public int superEggDrop(int K, int N) {
         if (N == 1) {
             return 1;
         }
         int[][] f = new int[N + 1][K + 1];
         for (int i = 1; i <= K; ++i) {
             f[1][i] = 1;
         }
         int ans = -1;
         for (int i = 2; i <= N; ++i) {
             for (int j = 1; j <= K; ++j) {
                 f[i][j] = 1 + f[i - 1][j - 1] + f[i - 1][j];
             }
             if (f[i][K] >= N) {
                 ans = i;
                 break;
             }
         }
         return ans;
     }
 }
 复杂度分析

 时间复杂度：O(K*N)O(K∗N)。事实上，更准确的时间复杂度应当为 O(K * T)O(K∗T)，我们不加证明地给出 N = O(T^K)N=O(T
 K
  )，因此有 O(K * T) = O(K * \sqrt[K]{N})O(K∗T)=O(K∗
 K
   
 N
 ​    
  )。

 空间复杂度：O(K*N)O(K∗N)。

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/super-egg-drop/solution/ji-dan-diao-luo-by-leetcode-solution-2/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func superEggDrop(_ K: Int, _ N: Int) -> Int {
        return 0
    }
}

//: [Next](@next)
