//: [Previous](@previous)

/*
 
 780. Reaching Points
 
 A move consists of taking a point (x, y) and transforming it to either (x, x+y) or (x+y, y).
 
 Given a starting point (sx, sy) and a target point (tx, ty), return True if and only if a sequence of moves exists to transform the point (sx, sy) to (tx, ty). Otherwise, return False.
 
 Examples:
 Input: sx = 1, sy = 1, tx = 3, ty = 5
 Output: True
 Explanation:
 One series of moves that transforms the starting point to the target is:
 (1, 1) -> (1, 2)
 (1, 2) -> (3, 2)
 (3, 2) -> (3, 5)
 
 Input: sx = 1, sy = 1, tx = 2, ty = 2
 Output: False
 
 Input: sx = 1, sy = 1, tx = 1, ty = 1
 Output: True
 
 Note:
 
 sx, sy, tx, ty will all be integers in the range [1, 10^9].
 
 */

/*
 
 方法一：穷举搜索【超出时间限制】
 思路和算法
 
 每个点都可以转换成两个子点，递归搜索所有子点。
 
 JavaPython
 
 class Solution {
 public boolean reachingPoints(int sx, int sy, int tx, int ty) {
 if (sx > tx || sy > ty) return false;
 if (sx == tx && sy == ty) return true;
 return reachingPoints(sx+sy, sy, tx, ty) || reachingPoints(sx, sx+sy, tx, ty);
 }
 }
 复杂度分析
 
 时间复杂度：O(2^{tx + ty})O(2
 tx+ty
 )，每一步转换都是 (x, y) -> (x+1, y) 或者 (x, y) -> (x, y+1)。
 
 空间复杂度：O(tx * ty)O(tx∗ty)，隐式调用栈的大小。
 
 方法二：动态规划【超出时间限制】
 思路和算法
 
 为了避免重复计算，使用一个集合 seen 存储方法一中递归搜索到的子点。
 
 JavaPython
 
 import java.awt.Point;
 
 class Solution {
 Set<Point> seen;
 int tx, ty;
 
 public boolean reachingPoints(int sx, int sy, int tx, int ty) {
 seen = new HashSet();
 this.tx = tx;
 this.ty = ty;
 search(new Point(sx, sy));
 return seen.contains(new Point(tx, ty));
 }
 
 public void search(Point P) {
 if (seen.contains(P)) return;
 if (P.x > tx || P.y > ty) return;
 seen.add(P);
 search(new Point(P.x + P.y, P.y));
 search(new Point(P.x, P.x + P.y));
 }
 }
 复杂度分析
 
 时间复杂度：O(tx * ty)O(tx∗ty)，最多 tx * ty 个点被搜索一次。
 
 空间复杂度：O(tx * ty)O(tx∗ty)，隐式调用栈的大小。
 
 方法三：回溯法（简单变体）【超出时间限制】
 思路
 
 每个父点 (x, y) 都有两个子点 (x, x+y) 和 (x+y, y)。由于坐标不能为负，每个子点 (x, y) 只能有一个父点，当 x >= y 时父点为 (x-y, y)；当 y > x 时父点为 (x, y-x)。
 
 
 
 从终点开始不断向上求解父点，可以判断给定点是否是正确的起点。例如，当终点是 (19, 12) 时，它的父点是 (7, 12)， (7, 5) 和 (2, 5)。因此 (2, 5) 是 (19, 12) 的起点。
 
 算法
 
 反复使用 {tx, ty} 中较大的值减去较小的值更新点，到达点 {sx, sy} 时返回 true。
 
 Java
 
 class Solution {
 public boolean reachingPoints(int sx, int sy, int tx, int ty) {
 while (tx >= sx && ty >= sy) {
 if (sx == tx && sy == ty)
 return true;
 if (tx > ty) tx -= ty;
 else ty -= tx;
 }
 return false;
 }
 }
 
 class Solution(object):
 def reachingPoints(self, sx, sy, tx, ty):
 while tx >= sx and ty >= sy:
 if sx == tx and sy == ty: return True
 if tx > ty:
 tx -= ty
 else:
 ty -= tx
 return False
 复杂度分析
 
 时间复杂度：O(\max(tx, ty))O(max(tx,ty))，如果 ty = 1，需要做 tx 次减法。
 
 空间复杂度：O(1)O(1)。
 
 方法四：回溯法 （取模变体）【通过】
 思路
 
 与方法三一样，使用回溯法。通过求解父点完成 (x, y) -> (x-y, y) 或 (x, y-x) 的转换，具体使用哪一种转换取决于哪种结果没有负数。
 
 可以使用模运算加速求解父点的过程。
 
 算法
 
 当 tx > ty 时，求解父点的运算是 tx - ty，并且它的往上 tx = tx % ty 个父点都是减去 ty。当同时满足 tx > ty 和 ty <= sy 时，可以一次性执行所有的这些操作，直接令 tx %= ty。
 
 否则，如果满足 tx > ty 和 ty <= sy，那么 ty 不再改变，只能不断从 tx 中减去 ty。因此， (tx - sx) % ty == 0 是结果为 true 的充要条件。
 
 上面的分析是针对 tx > ty 的情况，对于 ty > tx 的情况类似。 当 tx == ty 时，无法再求解父点。
 
 JavaPython
 
 class Solution {
 public boolean reachingPoints(int sx, int sy, int tx, int ty) {
 while (tx >= sx && ty >= sy) {
 if (tx == ty) break;
 if (tx > ty) {
 if (ty > sy) tx %= ty;
 else return (tx - sx) % ty == 0;
 } else {
 if (tx > sx) ty %= tx;
 else return (ty - sy) % tx == 0;
 }
 }
 return (tx == sx && ty == sy);
 }
 }
 复杂度分析
 
 时间复杂度：O(\log(\max{(tx, ty)}))O(log(max(tx,ty)))。 与欧几里得算法相似，假定模运算可以在 O(1)O(1) 时间内完成。
 
 空间复杂度：O(1)O(1)。
 
 作者：LeetCode
 链接：https://leetcode-cn.com/problems/reaching-points/solution/dao-da-zhong-dian-by-leetcode/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func reachingPoints(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        
        return moduleBackTracing(sx, sy, tx, ty)
    }
    
    func recursive(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        if (sx != tx || sy != ty) && (sx > tx || sy > ty) {
            return false
        }
        
        if sx == tx && sy == ty {
            return true
        }
        
        return reachingPoints(sx + sy, sy, tx, ty) || reachingPoints(sx, sx + sy, tx, ty)
    }
    
    func backTracing(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        var tx = tx, ty = ty
        
        while sx <= tx && sy <= ty {
            if sx == tx && sy == ty {
                return true
            }
            if tx > ty {
                tx -= ty
            } else if ty > tx {
                ty -= tx
            } else {
                break
            }
        }
        return false
    }
    
    func moduleBackTracing(_ sx: Int, _ sy: Int, _ tx: Int, _ ty: Int) -> Bool {
        var tx = tx, ty = ty
        while (tx >= sx && ty >= sy) {
            if tx == ty {
                break
            }
            if tx > ty {
                if ty > sy {
                    tx %= ty
                }
                else {
                    return (tx - sx) % ty == 0;
                }
            } else {
                if tx > sx {
                    ty %= tx
                }
                else {
                    return (ty - sy) % tx == 0;
                }
            }
        }
        return (tx == sx && ty == sy);
    }
}

var sx = 1, sy = 1, tx = 2, ty = 2
let solution = Solution()
let ans = solution.reachingPoints(sx, sy, tx, ty)

//: [Next](@next)
