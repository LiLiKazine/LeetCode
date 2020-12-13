//: [Previous](@previous)

/*
 
 904. Fruit Into Baskets
 
 In a row of trees, the i-th tree produces fruit with type tree[i].

 You start at any tree of your choice, then repeatedly perform the following steps:

 Add one piece of fruit from this tree to your baskets.  If you cannot, stop.
 Move to the next tree to the right of the current tree.  If there is no tree to the right, stop.
 Note that you do not have any choice after the initial choice of starting tree: you must perform step 1, then step 2, then back to step 1, then step 2, and so on until you stop.

 You have two baskets, and each basket can carry any quantity of fruit, but you want each basket to only carry one type of fruit each.

 What is the total amount of fruit you can collect with this procedure?

  

 Example 1:

 Input: [1,2,1]
 Output: 3
 Explanation: We can collect [1,2,1].
 Example 2:

 Input: [0,1,2,2]
 Output: 3
 Explanation: We can collect [1,2,2].
 If we started at the first tree, we would only collect [0, 1].
 Example 3:

 Input: [1,2,3,2,2]
 Output: 4
 Explanation: We can collect [2,3,2,2].
 If we started at the first tree, we would only collect [1, 2].
 Example 4:

 Input: [3,3,3,1,2,1,1,2,3,3,4]
 Output: 5
 Explanation: We can collect [1,2,1,1,2].
 If we started at the first tree or the eighth tree, we would only collect 4 fruits.
  

 Note:

 1 <= tree.length <= 40000
 0 <= tree[i] < tree.length
 
 */

/*
 class Solution {
     public int totalFruit(int[] tree) {
         int ans = 0, i = 0;
         Counter count = new Counter();
         for (int j = 0; j < tree.length; ++j) {
             count.add(tree[j], 1);
             while (count.size() >= 3) {
                 count.add(tree[i], -1);
                 if (count.get(tree[i]) == 0)
                     count.remove(tree[i]);
                 i++;
             }

             ans = Math.max(ans, j - i + 1);
         }

         return ans;
     }
 }

 class Counter extends HashMap<Integer, Integer> {
     public int get(int k) {
         return containsKey(k) ? super.get(k) : 0;
     }

     public void add(int k, int v) {
         put(k, get(k) + v);
     }
 }

 作者：LeetCode
 链接：https://leetcode-cn.com/problems/fruit-into-baskets/solution/shui-guo-cheng-lan-by-leetcode/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func totalFruit(_ tree: [Int]) -> Int {
        var head = 0, tail = 0, longest = 0, types: [Int] = [], mark = 0, _mark = 0
        while tail < tree.count {
            let type = tree[tail]
            if types.isEmpty {
                types.append(type)
                mark = tail
                _mark = tail
                tail += 1
            } else if types.count == 1 {
                if types[0] != type {
                    types.append(type)
                    _mark = tail
                } else {
                    mark = tail
                }
                tail += 1
            } else if types.contains(type) {
                if types[0] == type {
                    mark = tail
                }
                tail += 1
            } else {
                print(head, tail, mark, _mark)
                longest = max(longest, tail - head)
                head = mark
                print(head)
                mark = _mark
                types.removeFirst()
            }
        }
//        if types.count == 2 {
        print(head, tail, mark)
        longest = max(longest, tail - head)
//        }
        return longest
    }
}

let solution = Solution()
let ans = solution.totalFruit([1,1,6,5,6,6,1,1,1,1])
ans

//: [Next](@next)
