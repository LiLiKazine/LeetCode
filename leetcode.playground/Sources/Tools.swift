import Foundation

public class Tools {
    
}

public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public func buildTreeNode(_ vals: [Int?]) -> TreeNode? {
    var vals = Array(vals.reversed())
    guard case let first?? = vals.popLast() else { return nil }
    var root: TreeNode = TreeNode(first), lev: [TreeNode?] = [root]
    while !vals.isEmpty {
        var temp: [TreeNode?] = []
        for node in lev {
            if case let left?? = vals.popLast() {
                node?.left = TreeNode(left)
            }
            if case let right?? = vals.popLast() {
                node?.right = TreeNode(right)
            }
            temp.append(node?.left)
            temp.append(node?.right)
        }
        lev = temp
    }
    return root
}

public func printTree(_ root: TreeNode?) {
    var lev: [TreeNode?] = [root], output: [String] = []
    while !lev.isEmpty {
        var hasNode: Bool = false, temp: [TreeNode?] = []
        for node in lev {
            let str = node?.val == nil ? "nil" : String(node!.val)
            output.append(str)
            if let _ = node?.left, let _ = node?.right {
                hasNode = true
            }
            temp.append(node?.left)
            temp.append(node?.right)
        }
        lev = temp
        if !hasNode {
            break
        }
    }
    let res = output.joined(separator: ", ")
    print(res)
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() { self.val = 0; self.next = nil; }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public func buildListNode(_ vals: [Int]) -> ListNode? {
    var sentry = ListNode(0), tail = sentry
    for val in vals {
        let node = ListNode(val)
        tail.next = node
        tail = tail.next!
    }
    return sentry.next
}

public func stringListNode(_ root: ListNode?) -> String {
    var vals: [Int] = [], node = root
    while node != nil {
        vals.append(node!.val)
        node = node?.next
    }
    let output = vals.map { String($0) }.joined(separator: ", ")
    return "[\(output)]"
}
