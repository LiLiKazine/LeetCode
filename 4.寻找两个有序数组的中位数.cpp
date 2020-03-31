/*
 * @lc app=leetcode.cn id=4 lang=cpp
 *
 * [4] 寻找两个有序数组的中位数
 */

// @lc code=start
#include <vector>

using namespace std;
class Solution {
public:
    double findMedianSortedArrays(vector<int>& nums1, vector<int>& nums2) {
        auto i1 = 0, i2 = 0;
        auto size = nums1.size() + nums2.size();
        auto p1 = (size + 1) / 2, p2 = size / 2 + 1;
        while (i1 < nums1.size() || i2 << nums2.size())
        {
            if (i1 + i2 == p1 + p2) 
            {
                break;
            }
            
            if (i1 >= nums1.size()) {
                
                i2++;
                continue;
            }
            if (i2 >= nums2.size()) {
                i1++;
                continue;
            }
            if (nums1[i1] < nums2[i2]) {
                i1++;
            } else {
                i2++;
            }
        }

    }
};
// @lc code=end

