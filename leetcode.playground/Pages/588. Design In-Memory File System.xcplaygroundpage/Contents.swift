//: [Previous](@previous)

/*
 588. Design In-Memory File System
 困难
 
 Design a data structure that simulates an in-memory file system.

 Implement the FileSystem class:

 FileSystem() Initializes the object of the system.
 List<String> ls(String path)
 If path is a file path, returns a list that only contains this file's name.
 If path is a directory path, returns the list of file and directory names in this directory.
 The answer should in lexicographic order.
 void mkdir(String path) Makes a new directory according to the given path. The given directory path does not exist. If the middle directories in the path do not exist, you should create them as well.
 void addContentToFile(String filePath, String content)
 If filePath does not exist, creates that file containing given content.
 If filePath already exists, appends the given content to original content.
 String readContentFromFile(String filePath) Returns the content in the file at filePath.
  

 Example 1:


 Input
 ["FileSystem", "ls", "mkdir", "addContentToFile", "ls", "readContentFromFile"]
 [[], ["/"], ["/a/b/c"], ["/a/b/c/d", "hello"], ["/"], ["/a/b/c/d"]]
 Output
 [null, [], null, null, ["a"], "hello"]

 Explanation
 FileSystem fileSystem = new FileSystem();
 fileSystem.ls("/");                         // return []
 fileSystem.mkdir("/a/b/c");
 fileSystem.addContentToFile("/a/b/c/d", "hello");
 fileSystem.ls("/");                         // return ["a"]
 fileSystem.readContentFromFile("/a/b/c/d"); // return "hello"
  

 Constraints:

 1 <= path.length, filePath.length <= 100
 path and filePath are absolute paths which begin with '/' and do not end with '/' except that the path is just "/".
 You can assume that all directory names and file names only contain lowercase letters, and the same names will not exist in the same directory.
 You can assume that all operations will be passed valid parameters, and users will not attempt to retrieve file content or list a directory or file that does not exist.
 1 <= content.length <= 50
 At most 300 calls will be made to ls, mkdir, addContentToFile, and readContentFromFile.
 
 */

import Foundation

class FileSystem {
    
    class File {
        
        var content = ""
        
    }
    
    class Directory {
        
        var directorys = [String: Directory]()
        var files = [String: File]()
        
        func ls(_ path: String) -> [String] {
            var components = path.split(separator: "/").filter { !$0.isEmpty }
            if components.isEmpty {
                return Array(directorys.keys) + Array(files.keys)
            }
            let name = String(components.removeFirst())
            if let directory = directorys[name] {
                return directory.ls(components.joined(separator: "/"))
            }
            if components.isEmpty, let _ = files[name] {
                return [name]
            }
            return []
        }
        
        func mkdir(_ path: String) {
            var components = path.split(separator: "/").filter { !$0.isEmpty }
            guard components.count > 0 else {
                return
            }
            let name = String(components.removeFirst())
            if directorys[name] == nil {
                let fs = Directory()
                directorys[name] = fs
            }
            if let directory = directorys[name] {
                directory.mkdir(components.joined(separator: "/"))
            }
        }
        
        func addContentToFile(_ filePath: String, _ content: String) {
            var components = filePath.split(separator: "/").filter { !$0.isEmpty }
            guard components.count > 0 else {
                return
            }
            let name = String(components.removeFirst())
            if components.isEmpty {
                if let file = files[name] {
                    file.content += content
                } else {
                    let file = File()
                    file.content = content
                    files[name] = file
                }
            } else {
                if directorys[name] == nil {
                    let dir = Directory()
                    directorys[name] = dir
                }
                if let directory = directorys[name] {
                    directory.addContentToFile(components.joined(separator: "/"), content)
                }
            }
        }
        
        func readContentFromFile(_ filePath: String) -> String {
            var components = filePath.split(separator: "/").filter { !$0.isEmpty }
            let name = String(components.removeFirst())
            if components.isEmpty, let file = files[name] {
                return file.content
            }
            if let directory = directorys[name] {
                return directory.readContentFromFile(components.joined(separator: "/"))
            }
            return ""
        }
    
    }

    let directory = Directory()
    

    init() {
        
    }
    
    func ls(_ path: String) -> [String] {
        
        let ans = directory.ls(path)
        return ans.sorted()
    }
    
    func mkdir(_ path: String) {
        directory.mkdir(path)
    }
    
    func addContentToFile(_ filePath: String, _ content: String) {
        directory.addContentToFile(filePath, content)
    }
    
    func readContentFromFile(_ filePath: String) -> String {
        directory.readContentFromFile(filePath)
    }
}

/**
 * Your FileSystem object will be instantiated and called as such:
 * let obj = FileSystem()
 * let ret_1: [String] = obj.ls(path)
 * obj.mkdir(path)
 * obj.addContentToFile(filePath, content)
 * let ret_4: String = obj.readContentFromFile(filePath)
 */

//: [Next](@next)
