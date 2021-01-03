import Foundation

public class Tools {
    
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
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
