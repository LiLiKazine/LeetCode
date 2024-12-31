//: [Previous](@previous)

/*
 LCP 34. 二叉树染色
 中等
 小扣有一个根结点为 root 的二叉树模型，初始所有结点均为白色，可以用蓝色染料给模型结点染色，模型的每个结点有一个 val 价值。小扣出于美观考虑，希望最后二叉树上每个蓝色相连部分的结点个数不能超过 k 个，求所有染成蓝色的结点价值总和最大是多少？

 示例 1：

 输入：root = [5,2,3,4], k = 2

 输出：12

 解释：结点 5、3、4 染成蓝色，获得最大的价值 5+3+4=12image.png

 示例 2：

 输入：root = [4,1,3,9,null,null,2], k = 2

 输出：16

 解释：结点 4、3、9 染成蓝色，获得最大的价值 4+3+9=16image.png

 提示：

 1 <= k <= 10
 1 <= val <= 10000
 1 <= 结点数量 <= 10000
 */

import Foundation

class Solution {
    func maxValue(_ root: TreeNode?, _ k: Int) -> Int {

        func dfs(_ p: TreeNode?) -> [Int] {
            var res = Array(repeating: 0, count: k + 1)
            guard let p else { return res }
            
            let l_res = dfs(p.left)
            let r_res = dfs(p.right)
            
            var lmax = 0, rmax = 0
            for i in 0...k {
                lmax = max(lmax, l_res[i])
                rmax = max(rmax, r_res[i])
            }
            res[0] = lmax + rmax
            
            for i in 1...k {
                for j in 0..<i {
                    res[i] = max(res[i], l_res[j] + r_res[i - j - 1] + p.val)
                }
            }
            return res
        }
        
        let res = dfs(root).max() ?? 0
        return res
    }
}

//: [Next](@next)
