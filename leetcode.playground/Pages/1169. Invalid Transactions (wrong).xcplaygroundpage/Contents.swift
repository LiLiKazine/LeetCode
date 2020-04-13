//: [Previous](@previous)

/*
 
 1169. Invalid Transactions
 
 A transaction is possibly invalid if:

 the amount exceeds $1000, or;
 if it occurs within (and including) 60 minutes of another transaction with the same name in a different city.
 Each transaction string transactions[i] consists of comma separated values representing the name, time (in minutes), amount, and city of the transaction.

 Given a list of transactions, return a list of transactions that are possibly invalid.  You may return the answer in any order.

  

 Example 1:

 Input: transactions = ["alice,20,800,mtv","alice,50,100,beijing"]
 Output: ["alice,20,800,mtv","alice,50,100,beijing"]
 Explanation: The first transaction is invalid because the second transaction occurs within a difference of 60 minutes, have the same name and is in a different city. Similarly the second one is invalid too.
 Example 2:

 Input: transactions = ["alice,20,800,mtv","alice,50,1200,mtv"]
 Output: ["alice,50,1200,mtv"]
 Example 3:

 Input: transactions = ["alice,20,800,mtv","bob,50,1200,mtv"]
 Output: ["bob,50,1200,mtv"]
  

 Constraints:

 transactions.length <= 1000
 Each transactions[i] takes the form "{name},{time},{amount},{city}"
 Each {name} and {city} consist of lowercase English letters, and have lengths between 1 and 10.
 Each {time} consist of digits, and represent an integer between 0 and 1000.
 Each {amount} consist of digits, and represent an integer between 0 and 2000.
 通过次数3,532提交次数11,816
 
 */

import Foundation

class Solution {
    func invalidTransactions(_ transactions: [String]) -> [String] {
        var group: [String: [Int]] = [:]
        for i in 0..<transactions.count {
            let transaction = transactions[i]
            group[transaction.name] == nil ?
                group[transaction.name] = [i] :
                group[transaction.name]?.append(i)
        }
        var ans: [String] = []
        for key in group.keys {
            let strs = invalid(transactions, group[key]!)
            ans += strs
            
        }
        return ans
    }
    
    func invalid(_ transations: [String], _ indexes: [Int]) -> [String] {
        var ans: Set<String> = [], indexes = indexes
        for i in indexes {
            let t = transations[i]
            if t.amount > 1000 {
                ans.insert(t)
            }
        }
        indexes.sort { (i, j) -> Bool in
            transations[i].time < transations[j].time
        }
        var i = 0, j = i + 1
        while j < indexes.count {
            let i1 = indexes[i], i2 = indexes[j], t1 = transations[i1], t2 = transations[i2]
            if t2.time - t1.time <= 60  {
                if t2.city != t1.city {
                    ans.insert(transations[i1])
                    ans.insert(transations[i2])
                }
                j += 1
            } else {
                i += 1
                j = i+1
            }
        }
        return Array(ans)
    }

}

fileprivate extension String {
    
    var arr: [String] {
        return self.split(separator: ",")
            .map{ String($0) }
    }
    var name: String {
        return arr[0]
    }
    
    var time: Int {
        return Int(arr[1])!
    }
    
    var amount: Int {
        return Int(arr[2])!
    }
    
    var city: String {
        return arr[3]
    }
}

let solution = Solution()
let ans = solution.invalidTransactions(["xnova,261,1949,chicago","bob,206,1284,chicago","xnova,420,996,bangkok","chalicefy,704,1269,chicago","iris,124,329,bangkok","xnova,791,700,amsterdam","chalicefy,572,697,budapest","chalicefy,231,310,chicago","chalicefy,763,857,chicago","maybe,837,198,amsterdam","lee,99,940,bangkok","bob,132,1219,barcelona","lee,69,857,barcelona","lee,607,275,budapest","chalicefy,709,1171,amsterdam"])


/*
 
 ["xnova,261,1949,chicago",
 "lee,99,940,bangkok",
 "lee,69,857,barcelona",
 "bob,206,1284,chicago",
 "bob,132,1219,barcelona"
 ,"chalicefy,704,1269,chicago"
 ,"chalicefy,709,1171,amsterdam"]
 
 ["xnova,261,1949,chicago",
 "bob,206,1284,chicago",
 "lee,99,940,bangkok",
 "bob,132,1219,barcelona",
 "lee,69,857,barcelona",
 "chalicefy,704,1269,chicago",
 "chalicefy,763,857,chicago",
 "chalicefy,709,1171,amsterdam"]
 
 */
//: [Next](@next)
