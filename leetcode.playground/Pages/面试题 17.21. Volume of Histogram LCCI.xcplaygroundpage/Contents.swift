//: [Previous](@previous)

/*
 
 面试题 17.21. Volume of Histogram LCCI
 
 Imagine a histogram (bar graph). Design an algorithm to compute the volume of water it could hold if someone poured water across the top. You can assume that each histogram bar has width 1.



 The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of water (blue section) are being trapped. Thanks Marcos for contributing this image!

 Example:

 Input: [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 
 */

/*
 
 class Solution {
 public:
     int trap(vector<int>& height) {
         int ans = 0;
         stack<int> stk;
         int n = height.size();
         for (int i = 0; i < n; ++i) {
             while (!stk.empty() && height[i] > height[stk.top()]) {
                 int top = stk.top();
                 stk.pop();
                 if (stk.empty()) {
                     break;
                 }
                 int left = stk.top();
                 int currWidth = i - left - 1;
                 int currHeight = min(height[left], height[i]) - height[top];
                 ans += currWidth * currHeight;
             }
             stk.push(i);
         }
         return ans;
     }
 };
 
 */

class Solution {
    func trap(_ height: [Int]) -> Int {
        
        var stack: [Int] = [], ans = 0
        for i in 0..<height.count {
            while !stack.isEmpty && height[stack.last!] < height[i] {
                let top = stack.removeLast()
                if stack.isEmpty {
                    break
                }
                let left = stack.last!, curHeight = min(height[left], height[i]) - height[top]
                let width = i - left - 1
                let val = width * curHeight
                ans += val
            }
            stack.append(i)
        }
        return ans
    }
}

let height = [0,1,0,2,1,0,1,3,2,1,2,1]
let solution = Solution()
let ans = solution.trap(height)
ans

//: [Next](@next)
