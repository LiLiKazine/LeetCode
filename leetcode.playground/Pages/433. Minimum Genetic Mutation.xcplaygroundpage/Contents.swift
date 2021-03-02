//: [Previous](@previous)

/*
 
 433. Minimum Genetic Mutation
 
 A gene string can be represented by an 8-character long string, with choices from "A", "C", "G", "T".

 Suppose we need to investigate about a mutation (mutation from "start" to "end"), where ONE mutation is defined as ONE single character changed in the gene string.

 For example, "AACCGGTT" -> "AACCGGTA" is 1 mutation.

 Also, there is a given gene "bank", which records all the valid gene mutations. A gene must be in the bank to make it a valid gene string.

 Now, given 3 things - start, end, bank, your task is to determine what is the minimum number of mutations needed to mutate from "start" to "end". If there is no such a mutation, return -1.

 Note:

 Starting point is assumed to be valid, so it might not be included in the bank.
 If multiple mutations are needed, all mutations during in the sequence must be valid.
 You may assume start and end string is not the same.
  

 Example 1:

 start: "AACCGGTT"
 end:   "AACCGGTA"
 bank: ["AACCGGTA"]

 return: 1
  

 Example 2:

 start: "AACCGGTT"
 end:   "AAACGGTA"
 bank: ["AACCGGTA", "AACCGCTA", "AAACGGTA"]

 return: 2
  

 Example 3:

 start: "AAAAACCC"
 end:   "AACCCCCC"
 bank: ["AAAACCCC", "AAACCCCC", "AACCCCCC"]

 return: 3
 
 */

/*
 
 const vector<char> number = { 'A', 'C', 'G', 'T' };        //字母表
 class Solution {
 public:
     int minMutation(string start, string end, vector<string>& bank) {
         unordered_set<string> Bank(bank.begin(), bank.end());
         unordered_set<string> visited;
         visited.insert(start);
         int res = 0;
         queue<pair<string, int>> q;
         q.push({ start, 0 });

         while (!q.empty()){
             auto temp = q.front();
             q.pop();
             int step = temp.second;
             if (temp.first == end)
                 return step;

             for (int i = 0; i < temp.first.size(); i++){
                 char temp_t = temp.first[i];
                 for (int cc = 0; cc < number.size(); cc++){
                     if (number[cc] == temp_t)
                         continue;
                     temp.first[i] = number[cc];
                     if (Bank.count(temp.first) && visited.count(temp.first) == 0)
                     {
                         visited.insert(temp.first);
                         q.push({ temp.first, step + 1 });
                     }
                 }
                 temp.first[i] = temp_t;
             }
         }
         return -1;
     }
 };

 作者：guo-shi-wu-shuang-5
 链接：https://leetcode-cn.com/problems/minimum-genetic-mutation/solution/shen-sou-yan-sou-de-ji-chu-zhi-shi-by-gu-ac89/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

/*
 
 const vector<char> number = { 'A', 'C', 'G', 'T' };        //字母表
 class Solution {
 public:
     unordered_set<string> visited;
     vector<int> res;
     int minMutation(string start, string end, vector<string>& bank) {
         unordered_set<string> Bank(bank.begin(), bank.end());    //单词表
         visited.insert(start);                //将初始的单词放入已经遍历过的单词中
         backtrack(Bank, start, end, 0);        //暴力回溯出所有的从start到end的路径长度
         if (!res.empty())
         {
             sort(res.begin(), res.end());
             return res[0];
         }
         else
             return -1;
     }
     bool backtrack(unordered_set<string>& bank, string tt, string end, int step){
         if (tt.compare(end) == 0){
             res.push_back(step);
             return true;
         }
         for (int i = 0; i < tt.size(); i++){
             char temp_tt = tt[i];                            //记录被替换字母，用于还原
             for (int cc = 0;cc<number.size(); cc++){
                 if (number[cc] == temp_tt)                    //遇到相同的字母直接跳过
                     continue;
                 tt[i] = number[cc];                            //替换字母
                 if (bank.count(tt) && visited.count(tt) == 0){        //未遍历过且在字典里面的
                     visited.insert(tt);
                     backtrack(bank, tt, end, step + 1);
                     visited.erase(tt);
                 }
             }
             tt[i] = temp_tt;
         }
         return false;
     }
 };

 作者：guo-shi-wu-shuang-5
 链接：https://leetcode-cn.com/problems/minimum-genetic-mutation/solution/shen-sou-yan-sou-de-ji-chu-zhi-shi-by-gu-ac89/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        var visited: [Int] = Array(repeating: 0, count: bank.count + 1), bankDict: [String: Int] = [:]
        let characters: [Character] = [.init("A"), .init("C"), .init("G"), .init("T")]
        for i in 0..<bank.count {
            bankDict[bank[i]] = i + 1
        }
        bankDict[start] = 0
        guard let target = bankDict[end] else {
            return -1
        }
        var queue: [(Int, Int)] = [(0, 0)]
        visited[0] = 1
        while !queue.isEmpty {
            let tail = queue.removeFirst()
            if tail.0 == target {
                return tail.1
            }
            var gene: String = ""
            if tail.0 == 0 {
                gene = start
            } else {
                gene = bank[tail.0 - 1]
            }
            
            for (i, c) in gene.enumerated() {
                for replace in characters {
                    if replace == c {
                        continue
                    }
                    var newCharSet = Array(gene)
                    newCharSet[i] = replace
                    let newString = String(newCharSet)
                    if let index = bankDict[newString], visited[index] == 0 {
                        queue.append((index, tail.1 + 1))
                        visited[index] = 1
                    }
                }
            }
            
        }
        return -1
    }
   
}

//let start = "AACCGGTT",
//end = "AAACGGTA",
//bank = ["AACCGGTA", "AACCGCTA", "AAACGGTA"]
//let start = "AAAAACCC",
//end = "AACCCCCC",
//bank = ["AAAACCCC", "AAACCCCC", "AACCCCCC"]
//let start = "AACCGGTT",
//end = "AACCGGTA",
//bank: [String] = []
let start = "AAAACCCC",
end = "CCCCCCCC",
bank = ["AAAACCCA","AAACCCCA","AACCCCCA","AACCCCCC","ACCCCCCC","CCCCCCCC","AAACCCCC","AACCCCCC"]
let solution = Solution()
let ans = solution.minMutation(start, end, bank)
ans

//: [Next](@next)
