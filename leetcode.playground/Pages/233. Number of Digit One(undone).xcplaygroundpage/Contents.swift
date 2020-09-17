//: [Previous](@previous)

/*
 
 233. Number of Digit One
 
 Given an integer n, count the total number of digit 1 appearing in all non-negative integers less than or equal to n.

 Example:

 Input: 13
 Output: 6
 Explanation: Digit 1 occurred in the following numbers: 1, 10, 11, 12, 13.
 
 */

/*
 
 由上图所示，我们可以观察到每 1010 个数，个位上的 \text{'1'}’1’ 就会出现一次。同样的，每 100100 个数，十位上的 \text{'1'}’1’ 就会出现一次。这个规律可以用 (n/(i*10))*i 公式来表示。

 同时，如果十位上的数是 \text{'1'}’1’，那么最后 \text{'1'}’1’ 的数量要加上 x+1x+1，其中 xx 是个位上的数值。如果十位上的数大于 \text{'1'}’1’，那么十位上为 \text{'1'}’1’ 的所有的数都是符合要求的，这时候最后 \text{'1'}’1’ 的数量要加 1010。

 这个规律可以用公式 {\min(\max((\text{n mod (i*10)} )-i+1,0),i)}min(max((n mod (i*10))−i+1,0),i) 来表示。

 我们来看一个例子吧，有一个数 n = 1234n=1234。

 个位上 \text{'1'}’1’ 的数量 = 1234/101234/10 (对应 1,11,21,...1221) + \min(4,1)min(4,1) (对应 1231) = 124124

 十位上 \text{'1'}’1’ 的数量 = (1234/100)*10(1234/100)∗10 (对应 10,11,12,...,110,111,...1919) + \min(21, 10)min(21,10) (对应 1210,1211,...1219) = 130130

 百位上 \text{'1'}’1’ 的数量 = (1234/1000)*100(1234/1000)∗100 (对应 100,101,102,...,199) + \min(135, 100)min(135,100) (对应1100,1101...1199) = 200200

 千位上 \text{'1'}’1’ 的数量 = (1234/10000)*10000(1234/10000)∗10000 + \min(235, 1000)min(235,1000) (对应1000,1001,...1234) = 235235

 因此，总数 = 124+130+200+235 = 689124+130+200+235=689。

 算法

 将 ii 从 11 遍历到 nn，每次遍历 ii 扩大 1010 倍：
 (n/(i*10))*i(n/(i∗10))∗i 表示 (i*10)(i∗10) 位上 \text{'1'}’1’ 的个数。
 {\min(\max((\text{n mod (i*10)} )-i+1,0),i)}min(max((n mod (i*10))−i+1,0),i) 表示需要额外数的 (i*10)(i∗10) 位上 \text{'1'}’1’ 的个数。
 
 int countDigitOne(int n)
 {
     int countr = 0;
     for (long long i = 1; i <= n; i *= 10) {
         long long divider = i * 10;
         countr += (n / divider) * i + min(max(n % divider - i + 1, 0LL), i);
     }
     return countr;
 }

 作者：LeetCode
 链接：https://leetcode-cn.com/problems/number-of-digit-one/solution/shu-zi-1-de-ge-shu-by-leetcode/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

 作者：LeetCode
 链接：https://leetcode-cn.com/problems/number-of-digit-one/solution/shu-zi-1-de-ge-shu-by-leetcode/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func countDigitOne(_ n: Int) -> Int {
        return 0
    }
}

//: [Next](@next)
