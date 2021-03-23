//: [Previous](@previous)

/*
 
 341. Flatten Nested List Iterator
 
 Given a nested list of integers, implement an iterator to flatten it.
 
 Each element is either an integer, or a list -- whose elements may also be integers or other lists.
 
 Example 1:
 
 Input: [[1,1],2,[1,1]]
 Output: [1,1,2,1,1]
 Explanation: By calling next repeatedly until hasNext returns false,
 the order of elements returned by next should be: [1,1,2,1,1].
 Example 2:
 
 Input: [1,[4,[6]]]
 Output: [1,4,6]
 Explanation: By calling next repeatedly until hasNext returns false,
 the order of elements returned by next should be: [1,4,6].
 
 */


class NestedInteger {
    public func isInteger() -> Bool { return true }
    public func getInteger() -> Int { return 0 }
    
    
    public func setInteger(value: Int) {}
    public func add(elem: NestedInteger) {}
    public func getList() -> [NestedInteger] { return [] }
}

class NestedIterator {
    
    private var stack: [Int]
    
    init(_ nestedList: [NestedInteger]) {
        stack = []
        var nestedList = nestedList
        while !nestedList.isEmpty {
            let list = nestedList.removeFirst()
            if list.isInteger() {
                stack.append(list.getInteger())
            } else {
                nestedList.insert(contentsOf: list.getList(), at: 0)
            }
        }
    }
    
    func next() -> Int {
        return stack.removeFirst()
    }
    
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
}


//: [Next](@next)
