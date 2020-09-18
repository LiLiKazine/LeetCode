//: [Previous](@previous)

/*
 
 47. Permutations II
 
 Given a collection of numbers that might contain duplicates, return all possible unique permutations.

 Example:

 Input: [1,1,2]
 Output:
 [
   [1,1,2],
   [1,2,1],
   [2,1,1]
 ]
 
 */

class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        
        return recursive(nums);
    }
    
    func recursive(_ nums: [Int]) -> [[Int]] {
        if nums.count == 1 {
            return [nums]
        }
        var ans = [[Int]]()
        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i-1] {
                continue
            }
            var nums = nums;
            let head = nums.remove(at: i)
            let sum = recursive(nums).map{ [head] + $0 }
            ans.append(contentsOf: sum);
        }
        
        return ans
    }
}

let input = [1,1,2]
let solution = Solution()
let ans = solution.permuteUnique(input)

//: [Next](@next)
