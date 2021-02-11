//: [Previous](@previous)

/*
 
 703. Kth Largest Element in a Stream
 
 Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.

 Implement KthLargest class:

 KthLargest(int k, int[] nums) Initializes the object with the integer k and the stream of integers nums.
 int add(int val) Returns the element representing the kth largest element in the stream.
  

 Example 1:

 Input
 ["KthLargest", "add", "add", "add", "add", "add"]
 [[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]
 Output
 [null, 4, 5, 5, 8, 8]

 Explanation
 KthLargest kthLargest = new KthLargest(3, [4, 5, 8, 2]);
 kthLargest.add(3);   // return 4
 kthLargest.add(5);   // return 5
 kthLargest.add(10);  // return 5
 kthLargest.add(9);   // return 8
 kthLargest.add(4);   // return 8
  

 Constraints:

 1 <= k <= 104
 0 <= nums.length <= 104
 -104 <= nums[i] <= 104
 -104 <= val <= 104
 At most 104 calls will be made to add.
 It is guaranteed that there will be at least k elements in the array when you search for the kth element.
 
 */

class KthLargest {
    
    private let k: Int
    
    private var heap: Heap<Int>

    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        heap = Heap(priorityFunction: <)
        for n in nums {
            if heap.count == k {
                if heap.peek()! > n {
                    continue
                } else {
                    heap.dequeue()
                }
            }
            heap.enqueue(n)
        }
    }
    
    func add(_ val: Int) -> Int {
        if heap.count == k {
            if heap.peek()! > val {
                return heap.peek()!
            } else {
                heap.dequeue()
            }
        }
        heap.enqueue(val)
        return heap.peek()!
    }
}


public struct Heap<Element> {
    private(set) var elements: [Element]
    private let priorityFunction: (Element, Element) -> Bool
    
    public init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }
    
    private mutating func buildHeap() {
        for index in (0..<count/2).reversed() {
            shiftDown(elementAtIndex: index)
        }
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    public var count: Int {
        return elements.count
    }
    
    public func peek() -> Element? {
        return elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }
    
    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    
    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }
    
    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex else {
            return
        }
        
        elements.swapAt(firstIndex, secondIndex)
    }
    
    public mutating func enqueue(_ element: Element) {
        elements.append(element)
        shiftUp(elementAtIndex: count - 1)
    }
    
    mutating func shiftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index),
              isHigherPriority(at: index, than: parent) else {
            return
        }
        swapElement(at: index, with: parent)
        shiftUp(elementAtIndex: parent)
    }
    
    public mutating func dequeue() -> Element? {
        guard !isEmpty else {
            return nil
        }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            shiftDown(elementAtIndex: 0)
        }
        return element
    }
    
    mutating func shiftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        guard index != childIndex else {
            return
        }
        swapElement(at: index, with: childIndex)
        shiftDown(elementAtIndex: childIndex)
    }
}

let obj = KthLargest(3, [4, 5, 8, 2])
obj.add(3)
obj.add(5)
obj.add(10)
obj.add(9)
obj.add(4)

/**
 * Your KthLargest object will be instantiated and called as such:
 * let obj = KthLargest(k, nums)
 * let ret_1: Int = obj.add(val)
 */

//: [Next](@next)
