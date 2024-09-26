//: [Previous](@previous)

/*
 911. Online Election
 中等
 You are given two integer arrays persons and times. In an election, the ith vote was cast for persons[i] at time times[i].

 For each query at a time t, find the person that was leading the election at time t. Votes cast at time t will count towards our query. In the case of a tie, the most recent vote (among tied candidates) wins.

 Implement the TopVotedCandidate class:

 TopVotedCandidate(int[] persons, int[] times) Initializes the object with the persons and times arrays.
 int q(int t) Returns the number of the person that was leading the election at time t according to the mentioned rules.
  

 Example 1:

 Input
 ["TopVotedCandidate", "q", "q", "q", "q", "q", "q"]
 [[[0, 1, 1, 0, 0, 1, 0], [0, 5, 10, 15, 20, 25, 30]], [3], [12], [25], [15], [24], [8]]
 Output
 [null, 0, 1, 1, 0, 0, 1]

 Explanation
 TopVotedCandidate topVotedCandidate = new TopVotedCandidate([0, 1, 1, 0, 0, 1, 0], [0, 5, 10, 15, 20, 25, 30]);
 topVotedCandidate.q(3); // return 0, At time 3, the votes are [0], and 0 is leading.
 topVotedCandidate.q(12); // return 1, At time 12, the votes are [0,1,1], and 1 is leading.
 topVotedCandidate.q(25); // return 1, At time 25, the votes are [0,1,1,0,0,1], and 1 is leading (as ties go to the most recent vote.)
 topVotedCandidate.q(15); // return 0
 topVotedCandidate.q(24); // return 0
 topVotedCandidate.q(8); // return 1

  

 Constraints:

 1 <= persons.length <= 5000
 times.length == persons.length
 0 <= persons[i] < persons.length
 0 <= times[i] <= 109
 times is sorted in a strictly increasing order.
 times[0] <= t <= 109
 At most 104 calls will be made to q.
 
 */

import Foundation

class TopVotedCandidate {

    var poll = [[(Int, Int)]]()
    
    init(_ persons: [Int], _ times: [Int]) {
        let len = persons.count
        var poll = Array(repeating: [(0, 0)], count: len)
        for i in 0..<len {
            let time = times[i], p = persons[i]
            let cnt = poll[p].count
            if poll[p][cnt-1].0 == time {
                poll[p][cnt-1].1 += 1
            } else {
                poll[p].append((time, poll[p][cnt-1].1 + 1))
            }
        }
        self.poll = poll
    }
    
    func q(_ t: Int) -> Int {
        var leader: Int = 0
        var votes = 0
        var time = 0
        
        for (p, replay) in poll.enumerated() {
            var l = 0, r = replay.count - 1
            while l <= r {
                let mid = l + (r - l) / 2
                if replay[mid].0 > t {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            }
            if replay[r].1 > votes {
                leader = p
                votes = replay[r].1
                time = replay[r].0
            } else if replay[r].1 == votes && replay[r].0 > time {
                leader = p
                time = replay[r].0
            }
        }
        return leader
    }
}

/**
 * Your TopVotedCandidate object will be instantiated and called as such:
 * let obj = TopVotedCandidate(persons, times)
 * let ret_1: Int = obj.q(t)
 */

//: [Next](@next)
