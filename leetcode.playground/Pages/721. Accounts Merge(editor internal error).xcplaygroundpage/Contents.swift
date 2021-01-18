//: [Previous](@previous)

/*
 
 721. Accounts Merge
 
 Given a list accounts, each element accounts[i] is a list of strings, where the first element accounts[i][0] is a name, and the rest of the elements are emails representing emails of the account.

 Now, we would like to merge these accounts. Two accounts definitely belong to the same person if there is some email that is common to both accounts. Note that even if two accounts have the same name, they may belong to different people as people could have the same name. A person can have any number of accounts initially, but all of their accounts definitely have the same name.

 After merging the accounts, return the accounts in the following format: the first element of each account is the name, and the rest of the elements are emails in sorted order. The accounts themselves can be returned in any order.

 Example 1:
 Input:
 accounts = [["John", "johnsmith@mail.com", "john00@mail.com"], ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"], ["Mary", "mary@mail.com"]]
 Output: [["John", 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com'],  ["John", "johnnybravo@mail.com"], ["Mary", "mary@mail.com"]]
 Explanation:
 The first and third John's are the same person as they have the common email "johnsmith@mail.com".
 The second John and Mary are different people as none of their email addresses are used by other accounts.
 We could return these lists in any order, for example the answer [['Mary', 'mary@mail.com'], ['John', 'johnnybravo@mail.com'],
 ['John', 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com']] would still be accepted.
 Note:

 The length of accounts will be in the range [1, 1000].
 The length of accounts[i] will be in the range [1, 10].
 The length of accounts[i][j] will be in the range [1, 30].
 
 */

/*
 
 class Solution {
     public List<List<String>> accountsMerge(List<List<String>> accounts) {
         Map<String, Integer> emailToIndex = new HashMap<String, Integer>();
         Map<String, String> emailToName = new HashMap<String, String>();
         int emailsCount = 0;
         for (List<String> account : accounts) {
             String name = account.get(0);
             int size = account.size();
             for (int i = 1; i < size; i++) {
                 String email = account.get(i);
                 if (!emailToIndex.containsKey(email)) {
                     emailToIndex.put(email, emailsCount++);
                     emailToName.put(email, name);
                 }
             }
         }
         UnionFind uf = new UnionFind(emailsCount);
         for (List<String> account : accounts) {
             String firstEmail = account.get(1);
             int firstIndex = emailToIndex.get(firstEmail);
             int size = account.size();
             for (int i = 2; i < size; i++) {
                 String nextEmail = account.get(i);
                 int nextIndex = emailToIndex.get(nextEmail);
                 uf.union(firstIndex, nextIndex);
             }
         }
         Map<Integer, List<String>> indexToEmails = new HashMap<Integer, List<String>>();
         for (String email : emailToIndex.keySet()) {
             int index = uf.find(emailToIndex.get(email));
             List<String> account = indexToEmails.getOrDefault(index, new ArrayList<String>());
             account.add(email);
             indexToEmails.put(index, account);
         }
         List<List<String>> merged = new ArrayList<List<String>>();
         for (List<String> emails : indexToEmails.values()) {
             Collections.sort(emails);
             String name = emailToName.get(emails.get(0));
             List<String> account = new ArrayList<String>();
             account.add(name);
             account.addAll(emails);
             merged.add(account);
         }
         return merged;
     }
 }

 class UnionFind {
     int[] parent;

     public UnionFind(int n) {
         parent = new int[n];
         for (int i = 0; i < n; i++) {
             parent[i] = i;
         }
     }

     public void union(int index1, int index2) {
         parent[find(index2)] = find(index1);
     }

     public int find(int index) {
         if (parent[index] != index) {
             parent[index] = find(parent[index]);
         }
         return parent[index];
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/accounts-merge/solution/zhang-hu-he-bing-by-leetcode-solution-3dyq/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    
    var union: [Int] = [], emailToIndex: [String: Int] = [:], emailToName: [String: String] = [:]
    
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var emailIndex = 0
        for account in accounts {
            let name = account[0]
            for i in 1..<account.count {
                union.append(emailIndex)
                emailToIndex[account[i]] = emailIndex
                emailToName[account[i]] = name
                emailIndex += 1
            }
        }
        for account in accounts {
            guard accounts.count > 2 else {
                continue
            }
            let i1 = emailToIndex[account[1]]!
            for i in 2..<account.count {
                let i2 = emailToIndex[account[i]]!
                unit(i1, i2)
            }
        }
        var indexToGroup: [Int: [String]] = [:]
        for email in emailToIndex.keys {
            let index = find(emailToIndex[email]!)
            indexToGroup[index] = (indexToGroup[index] ?? []) + [email]
        }
        var ans: [[String]] = []
        for index in indexToGroup.keys {
            let emails = indexToGroup[index]!.sorted(by: <)
            var group: [String] = [emailToName[emails[0]]!]
            group.append(contentsOf: emails)
            ans.append(group)
        }
    
        return ans
    }
    
    func unit(_ i1: Int, _ i2: Int) {
        union[find(i2)] = find(i1)
    }
    
    func find(_ index: Int) -> Int {
        if union[index] != index {
            union[index] == find(union[index])
        }
        return union[index]
    }
}

let accounts = [["John", "johnsmith@mail.com", "john00@mail.com"], ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"], ["Mary", "mary@mail.com"]]
let solution = Solution()
let ans = solution.accountsMerge(accounts)
ans

//: [Next](@next)
