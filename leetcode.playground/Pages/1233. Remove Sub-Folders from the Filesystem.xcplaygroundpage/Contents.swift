//: [Previous](@previous)

/*
 
 1233. Remove Sub-Folders from the Filesystem
 
 Given a list of folders folder, return the folders after removing all sub-folders in those folders. You may return the answer in any order.

 If a folder[i] is located within another folder[j], it is called a sub-folder of it.

 The format of a path is one or more concatenated strings of the form: '/' followed by one or more lowercase English letters.

 For example, "/leetcode" and "/leetcode/problems" are valid paths while an empty string and "/" are not.
  

 Example 1:

 Input: folder = ["/a","/a/b","/c/d","/c/d/e","/c/f"]
 Output: ["/a","/c/d","/c/f"]
 Explanation: Folders "/a/b" is a subfolder of "/a" and "/c/d/e" is inside of folder "/c/d" in our filesystem.
 Example 2:

 Input: folder = ["/a","/a/b/c","/a/b/d"]
 Output: ["/a"]
 Explanation: Folders "/a/b/c" and "/a/b/d" will be removed because they are subfolders of "/a".
 Example 3:

 Input: folder = ["/a/b/c","/a/b/ca","/a/b/d"]
 Output: ["/a/b/c","/a/b/ca","/a/b/d"]
  

 Constraints:

 1 <= folder.length <= 4 * 104
 2 <= folder[i].length <= 100
 folder[i] contains only lowercase letters and '/'.
 folder[i] always starts with the character '/'.
 Each folder name is unique.
 
 */

class Solution {
    func removeSubfolders(_ folder: [String]) -> [String] {
        var folder = folder.map { Array($0.split(separator: "/")) }.sorted { $0.count < $1.count }
        var result: [String] = []
    L1:
        while !folder.isEmpty {
            let last = folder.removeLast()
        L2:
            for dir in folder {
                for i in 0..<dir.count {
                    if last[i] != dir[i] {
                        continue L2
                    }
                    
                }
                continue L1
            }
            result.append("/\(last.joined(separator: "/"))")
        }
        return result
        
    }
}

let folder = ["/a","/a/b","/c/d","/c/d/e","/c/f"]
let solution = Solution()
let ans = solution.removeSubfolders(folder)
print(ans)

//: [Next](@next)
