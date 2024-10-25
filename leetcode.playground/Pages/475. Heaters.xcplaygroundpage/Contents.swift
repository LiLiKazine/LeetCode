//: [Previous](@previous)

/*
 475. Heaters
 中等
 Winter is coming! During the contest, your first job is to design a standard heater with a fixed warm radius to warm all the houses.

 Every house can be warmed, as long as the house is within the heater's warm radius range.

 Given the positions of houses and heaters on a horizontal line, return the minimum radius standard of heaters so that those heaters could cover all houses.

 Notice that all the heaters follow your radius standard, and the warm radius will the same.

  

 Example 1:

 Input: houses = [1,2,3], heaters = [2]
 Output: 1
 Explanation: The only heater was placed in the position 2, and if we use the radius 1 standard, then all the houses can be warmed.
 Example 2:

 Input: houses = [1,2,3,4], heaters = [1,4]
 Output: 1
 Explanation: The two heaters were placed at positions 1 and 4. We need to use a radius 1 standard, then all the houses can be warmed.
 Example 3:

 Input: houses = [1,5], heaters = [2]
 Output: 3
  

 Constraints:

 1 <= houses.length, heaters.length <= 3 * 104
 1 <= houses[i], heaters[i] <= 109
 */

import Foundation

class Solution {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        let houses = houses.sorted(), heaters = heaters.sorted()
        var radius = 0
        
        func lowerBound(_ x: Int) -> Int {
            var l = 0, r = heaters.count
            while l < r {
                let mid = l + (r - l) / 2
                if heaters[mid] < x {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return l
        }
        
        for house in houses {
            let i = lowerBound(house)
            var r = Int.max
            if i < heaters.count {
                r = min(r, heaters[i] - house)
            }
            if i > 0 {
                r = min(r, house - heaters[i - 1])
            }
            radius = max(radius, r)
        }
        
        return radius
    }
}

//: [Next](@next)
