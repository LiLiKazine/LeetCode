//: [Previous](@previous)

/*
 
 1104. Path In Zigzag Labelled Binary Tree
 
 In an infinite binary tree where every node has two children, the nodes are labelled in row order.

 In the odd numbered rows (ie., the first, third, fifth,...), the labelling is left to right, while in the even numbered rows (second, fourth, sixth,...), the labelling is right to left.



 Given the label of a node in this tree, return the labels in the path from the root of the tree to the node with that label.

  

 Example 1:

 Input: label = 14
 Output: [1,3,4,14]
 Example 2:

 Input: label = 26
 Output: [1,2,6,10,26]
  

 Constraints:

 1 <= label <= 10^6
 
 */
// 1 2 4 8 16  2^n
/*
public List<Integer> pathInZigZagTree(int label) {
    ArrayList<Integer> integers = new ArrayList<>();//0.初始化存放结果的变量
    var a = (int) (Math.log(label) / Math.log(2));//2.计算label所在的层
    while (label > 1) {//5.循环直到遇到特殊情况1
        integers.add(label);//3.将label的结果添加到数组中
        label = (int) (3 * Math.pow(2, --a) - label / 2 - 1);//4.计算下一个label的值
    }
    integers.add(1);//6.添加特殊情况 1
    Collections.reverse(integers); //7.翻转数组
    return integers;//1.返回结果
}

作者：gre-z
链接：https://leetcode-cn.com/problems/path-in-zigzag-labelled-binary-tree/solution/jian-dan-yi-dong-de-gong-shi-shi-jian-guo-100-by-a/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
*/

import Foundation

class Solution {
    func pathInZigZagTree(_ label: Int) -> [Int] {
        var targetLev = 0, local = 0, lastLocal = -1, ans = [Int](), curLabel = label
        for i in 0...1000000 {
            if label >= pow2(2, i) && label < pow2(2, i+1) {
                targetLev = i + 1
                break
            }
        }
        for i in pow2(2, targetLev-1)..<pow2(2, targetLev) {
            if i == curLabel {
                local = i - pow2(2, targetLev-1)
                if lastLocal < 0 || abs(lastLocal - 2 * local) <= 1 {
                    
                }
            }
        }
        
        
        return ans
    }
    
    func pow2(_ i: Int, _ j: Int) -> Int {
        let res = pow(Double(i), Double(j))
        return Int(res)
    }
}

//: [Next](@next)
