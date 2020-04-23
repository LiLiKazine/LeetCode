//: [Previous](@previous)

/*
 
 481. Magical String
 
 A magical string S consists of only '1' and '2' and obeys the following rules:

 The string S is magical because concatenating the number of contiguous occurrences of characters '1' and '2' generates the string S itself.

 The first few elements of string S is the following: S = "1221121221221121122……"

 If we group the consecutive '1's and '2's in S, it will be:

 1 22 11 2 1 22 1 22 11 2 11 22 ......

 and the occurrences of '1's or '2's in each group are:

 1 2 2 1 1 2 1 2 2 1 2 2 ......

 You can see that the occurrence sequence above is the S itself.

 Given an integer N as input, return the number of '1's in the first N number in the magical string S.

 Note: N will not exceed 100,000.

 Example 1:
 Input: 6
 Output: 3
 Explanation: The first 6 elements of magical string S is "12211" and it contains three 1's, so return 3.
 
 
 */

/*
 根据题目规则，这种字符串可以根据自己的内容生成自己，每次的操作只有两种可能:
 操作1.字符串末尾添加str[i]个1,i+1继续生成
 操作2.字符串末尾添加str[i]个2,i+1继续生成

 好了，可以开始生成字符串了!!!
 题目已经给出了一个初始操作:添加1个1
 i=0   添加1个1   "1"     i=1

 这时上面的两种操作都无法进行，因为我们没有s[1]
 但是事实上，如果我们上一次进行了操作1，这次只能进行操作2，反之亦然。
 因为连续的相同操作会使上一处计数增加，违反规则。

 所以下一步只能是 添加2个2：
 i=1   添加2个2   "122"    i=2

 此时 s[2] = 2 所以当前操作:添加2个1
 i=2   添加2个1   "12211"   i=3

 s[3] = 1 操作:添加1个2
 i=3   添加1个2   "122112"   i=4

 ...... 不断生成

 
  if n==0: return 0
         magic,index,cur,res = [1,0,0],2,1,1
         while len(magic)<n:
             magic.append(cur)
             res += cur
             if magic[index]==0 and len(magic)<n:
                 magic.append(cur)
                 res += cur
             cur ^= 1
             index += 1

 
 
 */

import Foundation

class Solution {
    func magicalString(_ n: Int) -> Int {
            
        return 0
    }
}

//: [Next](@next)
