//: [Previous](@previous)

/*
 2386. Find the K-Sum of an Array
 困难
 You are given an integer array nums and a positive integer k. You can choose any subsequence of the array and sum all of its elements together.

 We define the K-Sum of the array as the kth largest subsequence sum that can be obtained (not necessarily distinct).

 Return the K-Sum of the array.

 A subsequence is an array that can be derived from another array by deleting some or no elements without changing the order of the remaining elements.

 Note that the empty subsequence is considered to have a sum of 0.

  

 Example 1:

 Input: nums = [2,4,-2], k = 5
 Output: 2
 Explanation: All the possible subsequence sums that we can obtain are the following sorted in decreasing order:
 - 6, 4, 4, 2, 2, 0, 0, -2.
 The 5-Sum of the array is 2.
 Example 2:

 Input: nums = [1,-2,3,4,-10,12], k = 16
 Output: 10
 Explanation: The 16-Sum of the array is 10.
  

 Constraints:

 n == nums.length
 1 <= n <= 105
 -109 <= nums[i] <= 109
 1 <= k <= min(2000, 2n)
 
 */

import Foundation

class Solution {
    func kSum(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums, total = 0
        for i in 0..<nums.count {
            let num = nums[i]
            if num >= 0 {
                total += num
            } else {
                nums[i] = -num
            }
        }
        if k == 1 {
            return total
        }
        nums.sort()
        var least = 0
        var heap = Heap<[Int]> { $0[0] <= $1[0] }
        heap.enqueue([nums[0], 0])
        for _ in 2...k {
            let top = heap.dequeue()!
            let sum = top[0], i = top[1]
            least = sum
            if i == nums.count - 1 {
                continue
            }
            heap.enqueue([sum + nums[i + 1], i + 1])
            heap.enqueue([sum - nums[i] + nums[i + 1], i + 1])
        }
        return total - least
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
//: [Next](@next)
