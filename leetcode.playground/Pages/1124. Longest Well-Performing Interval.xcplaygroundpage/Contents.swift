//: [Previous](@previous)

/*
 
 1124. Longest Well-Performing Interval
 
 We are given hours, a list of the number of hours worked per day for a given employee.

 A day is considered to be a tiring day if and only if the number of hours worked is (strictly) greater than 8.

 A well-performing interval is an interval of days for which the number of tiring days is strictly larger than the number of non-tiring days.

 Return the length of the longest well-performing interval.

  

 Example 1:

 Input: hours = [9,9,6,0,6,6,9]
 Output: 3
 Explanation: The longest well-performing interval is [9,9,6].
 Example 2:

 Input: hours = [6,6,6]
 Output: 0
  

 Constraints:

 1 <= hours.length <= 104
 0 <= hours[i] <= 16
 
 */

/*
 
 class Solution {
 public:
     int longestWPI(vector<int>& hours) {
         int n = hours.size();
         vector<int> s(n + 1);
         stack<int> stk;
         stk.push(0);
         for (int i = 1; i <= n; i++) {
             s[i] = s[i - 1] + (hours[i - 1] > 8 ? 1 : -1);
             if (s[stk.top()] > s[i]) {
                 stk.push(i);
             }
         }

         int res = 0;
         for (int r = n; r >= 1; r--) {
             while (stk.size() && s[stk.top()] < s[r]) {
                 res = max(res, r - stk.top());
                 stk.pop();
             }
         }
         return res;
     }
 };
 
 */

class Solution {
    func longestWPI(_ hours: [Int]) -> Int {
        
        let tiringHour = 8
        
        var s = Array(repeating: 0, count: hours.count + 1)
        var stk = [0]
        
        for i in 1...hours.count {
            s[i] = s[i - 1] + (hours[i - 1] > tiringHour ? 1 : -1)
            if s[stk.last!] > s[i] {
                stk.append(i)
            }
        }
        
        var ans = 0
        for r in stride(from: hours.count, to: 0, by: -1) {
            while !stk.isEmpty && s[stk.last!] < s[r] {
                ans = max(ans, r - stk.last!)
                stk.removeLast()
            }
        }
        
        return ans
    }
}

let hours = [6,9,9]
//let hours = [6,6,6]
//let hours = [9,9,6,0,6,6,9]
let solution = Solution()
let ans = solution.longestWPI(hours)
print(ans)

//: [Next](@next)
