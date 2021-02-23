//: [Previous](@previous)

/*
 
 1052. Grumpy Bookstore Owner
 
 Today, the bookstore owner has a store open for customers.length minutes.  Every minute, some number of customers (customers[i]) enter the store, and all those customers leave after the end of that minute.

 On some minutes, the bookstore owner is grumpy.  If the bookstore owner is grumpy on the i-th minute, grumpy[i] = 1, otherwise grumpy[i] = 0.  When the bookstore owner is grumpy, the customers of that minute are not satisfied, otherwise they are satisfied.

 The bookstore owner knows a secret technique to keep themselves not grumpy for X minutes straight, but can only use it once.

 Return the maximum number of customers that can be satisfied throughout the day.

  

 Example 1:

 Input: customers = [1,0,1,2,1,1,7,5], grumpy = [0,1,0,1,0,1,0,1], X = 3
 Output: 16
 Explanation: The bookstore owner keeps themselves not grumpy for the last 3 minutes.
 The maximum number of customers that can be satisfied = 1 + 1 + 1 + 1 + 7 + 5 = 16.
  

 Note:

 1 <= X <= customers.length == grumpy.length <= 20000
 0 <= customers[i] <= 1000
 0 <= grumpy[i] <= 1
 
 */

/*
 
 class Solution {
     public int maxSatisfied(int[] customers, int[] grumpy, int X) {
         int total = 0;
         int n = customers.length;
         for (int i = 0; i < n; i++) {
             if (grumpy[i] == 0) {
                 total += customers[i];
             }
         }
         int increase = 0;
         for (int i = 0; i < X; i++) {
             increase += customers[i] * grumpy[i];
         }
         int maxIncrease = increase;
         for (int i = X; i < n; i++) {
             increase = increase - customers[i - X] * grumpy[i - X] + customers[i] * grumpy[i];
             maxIncrease = Math.max(maxIncrease, increase);
         }
         return total + maxIncrease;
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/grumpy-bookstore-owner/solution/ai-sheng-qi-de-shu-dian-lao-ban-by-leetc-dloq/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ X: Int) -> Int {
        var total = 0, increase = 0, ans = 0
        for i in 0..<customers.count {
            let customer = customers[i], isGrumpy = grumpy[i] == 1
            if !isGrumpy {
                total += customer
            }
            if i < X && isGrumpy {
                increase += customer
            }
        }
        ans = increase
        for i in X..<customers.count {
            increase = increase - customers[i - X] * grumpy[i - X] + customers[i] * grumpy[i]
            ans = max(increase, ans)
        }
        return total + ans
    }
}

let customers = [1,0,1,2,1,1,7,5], grumpy = [0,1,0,1,0,1,0,1], X = 3
let solution = Solution()
let ans = solution.maxSatisfied(customers, grumpy, X)
ans

//: [Next](@next)
