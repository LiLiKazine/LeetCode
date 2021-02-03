//: [Previous](@previous)

/*
 
 480. Sliding Window Median
 
 Median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value. So the median is the mean of the two middle value.

 Examples:
 [2,3,4] , the median is 3

 [2,3], the median is (2 + 3) / 2 = 2.5

 Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position. Your job is to output the median array for each window in the original array.

 For example,
 Given nums = [1,3,-1,-3,5,3,6,7], and k = 3.

 Window position                Median
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       1
  1 [3  -1  -3] 5  3  6  7       -1
  1  3 [-1  -3  5] 3  6  7       -1
  1  3  -1 [-3  5  3] 6  7       3
  1  3  -1  -3 [5  3  6] 7       5
  1  3  -1  -3  5 [3  6  7]      6
 Therefore, return the median sliding window as [1,-1,-1,3,5,6].

 Note:
 You may assume k is always valid, ie: k is always smaller than input array's size for non-empty array.
 Answers within 10^-5 of the actual value will be accepted as correct.
 
 */



class Solution {
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        let dh = DualHeap(k: k)
        for i in 0..<k {
            dh.insert(i)
        }
        var ans: [Double] = Array(repeating: 0, count: nums.count - k + 1)
        ans[0] = dh.median()
        for i in k..<nums.count {
            dh.insert(k)
            dh.erase(nums[i - k])
            ans[i - k + 1] = dh.median()
        }
        
        return ans
    }
}


class DualHeap {
    
    private var small: Heap<Int>
    private var large: Heap<Int>
    
    private var delayed: Dictionary<Int, Int>
    
    private let k: Int
    private var smallSize: Int, largeSize: Int
    
    init(k: Int) {
        self.k = k
        small = Heap(priorityFunction: >)
        large = Heap(priorityFunction: <)
        delayed = [:]
        smallSize = 0
        largeSize = 0
    }
    
    func median() -> Double {
        let res = (k & 1) == 1 ? Double(small.peek()!) : (Double(small.peek()!) + Double(large.peek()!)) / 2.0
        return res
    }
    
    func insert(_ n: Int) {
        if small.isEmpty || small.peek()! >= n {
            small.enqueue(n)
            smallSize += 1
        } else {
            large.enqueue(n)
            largeSize += 1
        }
        makeBalance()
    }
    
    func erase(_ n: Int) {
        delayed[n] = (delayed[n] ?? 0) + 1
        if n <= small.peek()! {
            smallSize -= 1
            if n == small.peek()! {
                prune(&small)
            }
        } else {
            largeSize -= 1
            if n == large.peek()! {
                prune(&large)
            }
        }
        makeBalance()
    }
    
    private func makeBalance() {
        if smallSize > largeSize + 1 {
            large.enqueue(small.dequeue()!)
            smallSize -= 1
            largeSize += 1
            prune(&small)
        } else if smallSize < largeSize {
            small.enqueue(large.dequeue()!)
            smallSize += 1
            largeSize -= 1
            prune(&large)
        }
    }
    
    private func prune(_ heap: inout Heap<Int>) {
        while !heap.isEmpty {
            let n = heap.peek()!
            if delayed[n] != nil {
                delayed[n] = delayed[n]! - 1
                if delayed[n]! <= 0 {
                    delayed.removeValue(forKey: n)
                }
                heap.dequeue()
            } else {
                break
            }
        }
    }
}

let nums = [1,3,-1,-3,5,3,6,7],
k = 3
let solution = Solution()
let ans = solution.medianSlidingWindow(nums, k)
ans


//: [Next](@next)
