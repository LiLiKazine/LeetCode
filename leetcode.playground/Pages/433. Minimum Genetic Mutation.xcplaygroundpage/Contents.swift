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

class Solution {
    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
        
        var map = [String: Int](), visited = Array(repeating: false, count: bank.count)
        for i in 0..<bank.count {
            map[bank[i]] = i
        }
        let mutations = ["A", "C", "G", "T"]
        var q = [startGene], ans = 0
        while q.count > 0 {
            var nexts = [String]()
            while q.count > 0 {
                let g = q.removeFirst()
                if g == endGene {
                    return ans
                }
                let gene = Array(g).map { String($0) }
                for mutation in mutations {
                    for i in 0..<gene.count {
                        var gene = gene
                        gene[i] = mutation
                        let g = gene.joined()
                        if let i = map[g], !visited[i] {
                            nexts.append(g)
                            visited[i] = true
                        }
                    }
                }
            }
            q = nexts
            ans += 1
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
*/
//: [Next](@next)
