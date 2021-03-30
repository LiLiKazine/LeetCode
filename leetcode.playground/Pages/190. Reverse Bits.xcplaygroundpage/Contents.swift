//: [Previous](@previous)

/*
 
 190. Reverse Bits
 
 Reverse bits of a given 32 bits unsigned integer.

 Note:

 Note that in some languages such as Java, there is no unsigned integer type. In this case, both input and output will be given as a signed integer type. They should not affect your implementation, as the integer's internal binary representation is the same, whether it is signed or unsigned.
 In Java, the compiler represents the signed integers using 2's complement notation. Therefore, in Example 2 above, the input represents the signed integer -3 and the output represents the signed integer -1073741825.
 Follow up:

 If this function is called many times, how would you optimize it?

  

 Example 1:

 Input: n = 00000010100101000001111010011100
 Output:    964176192 (00111001011110000010100101000000)
 Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.
 Example 2:

 Input: n = 11111111111111111111111111111101
 Output:   3221225471 (10111111111111111111111111111111)
 Explanation: The input binary string 11111111111111111111111111111101 represents the unsigned integer 4294967293, so return 3221225471 which its binary representation is 10111111111111111111111111111111.
  

 Constraints:

 The input must be a binary string of length 32
 
 */

/*
 
 class Solution {
 public:
     uint32_t reverseBits(uint32_t n) {
         uint32_t rev = 0;
         for (int i = 0; i < 32 && n > 0; ++i) {
             rev |= (n & 1) << (31 - i);
             n >>= 1;
         }
         return rev;
     }
 };

 class Solution {
 private:
     const uint32_t M1 = 0x55555555; // 01010101010101010101010101010101
     const uint32_t M2 = 0x33333333; // 00110011001100110011001100110011
     const uint32_t M4 = 0x0f0f0f0f; // 00001111000011110000111100001111
     const uint32_t M8 = 0x00ff00ff; // 00000000111111110000000011111111

 public:
     uint32_t reverseBits(uint32_t n) {
         n = n >> 1 & M1 | (n & M1) << 1;
         n = n >> 2 & M2 | (n & M2) << 2;
         n = n >> 4 & M4 | (n & M4) << 4;
         n = n >> 8 & M8 | (n & M8) << 8;
         return n >> 16 | n << 16;
     }
 };

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/reverse-bits/solution/dian-dao-er-jin-zhi-wei-by-leetcode-solu-yhxz/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var ans: Int = 0, n = n, i = 0
        while i < 32 && n > 0 {
            ans |= (n & 1) << (31 - i)
            n >>= 1
            i += 1
        }
        return ans
    }
}

let solution = Solution()
let ans = solution.reverseBits(43261596)
ans

//: [Next](@next)
