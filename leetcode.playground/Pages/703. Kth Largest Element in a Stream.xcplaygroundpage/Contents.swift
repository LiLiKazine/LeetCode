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
