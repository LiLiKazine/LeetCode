//: [Previous](@previous)

/*
 
 406. Queue Reconstruction by Height
 
 Suppose you have a random list of people standing in a queue. Each person is described by a pair of integers (h, k), where h is the height of the person and k is the number of people in front of this person who have a height greater than or equal to h. Write an algorithm to reconstruct the queue.

 Note:
 The number of people is less than 1,100.

  
 Example

 Input:
 [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]

 Output:
 [[5,0], [7,0], [5,2], [6,1], [4,4], [7,1]]
 
 */

/*
 
 class Solution {
     public int[][] reconstructQueue(int[][] people) {
         Arrays.sort(people, new Comparator<int[]>() {
             public int compare(int[] person1, int[] person2) {
                 if (person1[0] != person2[0]) {
                     return person1[0] - person2[0];
                 } else {
                     return person2[1] - person1[1];
                 }
             }
         });
         int n = people.length;
         int[][] ans = new int[n][];
         for (int[] person : people) {
             int spaces = person[1] + 1;
             for (int i = 0; i < n; ++i) {
                 if (ans[i] == null) {
                     --spaces;
                     if (spaces == 0) {
                         ans[i] = person;
                         break;
                     }
                 }
             }
         }
         return ans;
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/queue-reconstruction-by-height/solution/gen-ju-shen-gao-zhong-jian-dui-lie-by-leetcode-sol/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        var ans = Array(repeating: [Int](), count: people.count)
        let people = people.sorted { (arr1, arr2) -> Bool in
            if arr1[0] != arr2[0] {
                return arr1[0] < arr2[0]
            } else {
                return arr1[1] < arr2[1]
            }
        }
        for person in people {
            let k = person[1], h = person[0]
            var slot = 0, index = 0;
            
            for i in 0..<ans.count {
                let pos = ans[i]
                if slot == k && pos.isEmpty {
                    index = i
                    break
                }
                if pos.isEmpty {
                    slot += 1
                } else if pos[0] == h {
                    slot += 1
                }
            }
            ans[index] = person
            print(ans, person, k)
        }
        return ans
    }
}

let people = [[7,0], [4,4], [7,1], [5,0], [6,1], [5,2]]
let solution = Solution()
let ans = solution.reconstructQueue(people)
ans

//: [Next](@next)
