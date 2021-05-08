//: [Previous](@previous)

/*
 
 1723. Find Minimum Time to Finish All Jobs
 
 You are given an integer array jobs, where jobs[i] is the amount of time it takes to complete the ith job.

 There are k workers that you can assign jobs to. Each job should be assigned to exactly one worker. The working time of a worker is the sum of the time it takes to complete all jobs assigned to them. Your goal is to devise an optimal assignment such that the maximum working time of any worker is minimized.

 Return the minimum possible maximum working time of any assignment.

  

 Example 1:

 Input: jobs = [3,2,3], k = 3
 Output: 3
 Explanation: By assigning each person one job, the maximum time is 3.
 Example 2:

 Input: jobs = [1,2,4,7,8], k = 2
 Output: 11
 Explanation: Assign the jobs the following way:
 Worker 1: 1, 2, 8 (working time = 1 + 2 + 8 = 11)
 Worker 2: 4, 7 (working time = 4 + 7 = 11)
 The maximum working time is 11.
  

 Constraints:

 1 <= k <= jobs.length <= 12
 1 <= jobs[i] <= 107
 
 */

/*
 
 class Solution {
 public:
     bool backtrack(vector<int>& jobs, vector<int>& workloads, int idx, int limit) {
         if (idx >= jobs.size()) {
             return true;
         }
         int cur = jobs[idx];
         for (auto& workload : workloads) {
             if (workload + cur <= limit) {
                 workload += cur;
                 if (backtrack(jobs, workloads, idx + 1, limit)) {
                     return true;
                 }
                 workload -= cur;
             }
             // 如果当前工人未被分配工作，那么下一个工人也必然未被分配工作
             // 或者当前工作恰能使该工人的工作量达到了上限
             // 这两种情况下我们无需尝试继续分配工作
             if (workload == 0 || workload + cur == limit) {
                 break;
             }
         }
         return false;
     }

     bool check(vector<int>& jobs, int k, int limit) {
         vector<int> workloads(k, 0);
         return backtrack(jobs, workloads, 0, limit);
     }

     int minimumTimeRequired(vector<int>& jobs, int k) {
         sort(jobs.begin(), jobs.end(), greater<int>());
         int l = jobs[0], r = accumulate(jobs.begin(), jobs.end(), 0);
         while (l < r) {
             int mid = (l + r) >> 1;
             if (check(jobs, k, mid)) {
                 r = mid;
             } else {
                 l = mid + 1;
             }
         }
         return l;
     }
 };
 
 */

class Solution {
    private var jobs: [Int] = [], k = 0, workload: [Int] = []
    
    private func dfs(_ n: Int, _ limit: Int) -> Bool {
        if n >= jobs.count {
            return true
        }
        
        for i in 0..<k {
            workload[i] += jobs[n]
            if workload[i] <= limit {
                let res = dfs(n + 1, limit)
                if res {
                    return true
                }
            }
            workload[i] -= jobs[n]
            if workload[i] == 0 || workload[i] + jobs[n] == limit {
                break
            }
        }
        return false
    }
    
    func minimumTimeRequired(_ jobs: [Int], _ k: Int) -> Int {
        var jobs = jobs.sorted(), l = jobs[0], h = jobs.reduce(0, +)
        self.jobs = jobs
        self.k = k
        
        while l < h {
            let mid = (l + h) / 2
            self.workload = Array(repeating: 0, count: k)
            let res = dfs(0, mid)
            if res {
                h = mid
            } else {
                l = mid + 1
            }
        }
        
        return l
    }
}

let jobs = [1,2,4,7,8], k = 2
let solution = Solution()
let ans = solution.minimumTimeRequired(jobs, k)
ans

//: [Next](@next)
