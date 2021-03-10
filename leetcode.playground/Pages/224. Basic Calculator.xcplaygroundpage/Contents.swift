//: [Previous](@previous)

/*
 
 224. Basic Calculator
 
 Given a string s representing an expression, implement a basic calculator to evaluate it.

  

 Example 1:

 Input: s = "1 + 1"
 Output: 2
 Example 2:

 Input: s = " 2-1 + 2 "
 Output: 3
 Example 3:

 Input: s = "(1+(4+5+2)-3)+(6+8)"
 Output: 23
  

 Constraints:

 1 <= s.length <= 3 * 105
 s consists of digits, '+', '-', '(', ')', and ' '.
 s represents a valid expression.
 
 */

/*
 
 class Solution {
 public:
     int calculate(string s) {
         stack<int> ops;
         ops.push(1);
         int sign = 1;

         int ret = 0;
         int n = s.length();
         int i = 0;
         while (i < n) {
             if (s[i] == ' ') {
                 i++;
             } else if (s[i] == '+') {
                 sign = ops.top();
                 i++;
             } else if (s[i] == '-') {
                 sign = -ops.top();
                 i++;
             } else if (s[i] == '(') {
                 ops.push(sign);
                 i++;
             } else if (s[i] == ')') {
                 ops.pop();
                 i++;
             } else {
                 long num = 0;
                 while (i < n && s[i] >= '0' && s[i] <= '9') {
                     num = num * 10 + s[i] - '0';
                     i++;
                 }
                 ret += sign * num;
             }
         }
         return ret;
     }
 };

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/basic-calculator/solution/ji-ben-ji-suan-qi-by-leetcode-solution-jvir/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func calculate(_ s: String) -> Int {
        var s = Array(s), i = 0, sign = 1, stack: [Int] = [1], ans = 0
        
        while i < s.count {
            let c = String(s[i])
            switch c {
            case "+":
                sign = stack.last!
            case "-":
                sign = -stack.last!
            case "(":
                stack.append(sign)
            case ")":
                stack.removeLast()
            case " ":
                break
            default:
                var num = 0
                while i < s.count && Int(String(s[i])) != nil {
                    num *= 10
                    num += Int(String(s[i]))!
                    i += 1
                }
                ans += num * sign
                continue
            }
            i += 1
        }
        return ans
    }
}

//let s = " 2-1 + 2 "
let s = "(1+(4+5+2)-3)+(6+8)"
let solution = Solution()
let ans = solution.calculate(s)
ans

//: [Next](@next)
