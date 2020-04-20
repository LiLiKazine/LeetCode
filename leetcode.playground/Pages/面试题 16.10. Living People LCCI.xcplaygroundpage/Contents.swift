//: [Previous](@previous)

/*
 
 面试题 16.10. Living People LCCI
 
 Given a list of people with their birth and death years, implement a method to compute the year with the most number of people alive. You may assume that all people were born between 1900 and 2000 (inclusive). If a person was alive during any portion of that year, they should be included in that year's count. For example, Person (birth= 1908, death= 1909) is included in the counts for both 1908 and 1909.

 If there are more than one years that have the most number of people alive, return the smallest one.

 Example:

 Input:
 birth = {1900, 1901, 1950}
 death = {1948, 1951, 2000}
 Output:  1901
 Note:

 0 < birth.length == death.length <= 10000
 birth[i] <= death[i]
 
 */

import Foundation

class Solution {
    func maxAliveYear(_ birth: [Int], _ death: [Int]) -> Int {
        var year = 2001, alive = 0, record: [Int: Int] = [:]
        for i in 0..<birth.count {
            let b = birth[i]
            let d = death[i]
            for j in b...d {
                if record[j] == nil {
                    record[j] = 1
                } else {
                    record[j]! += 1
                }
            }
        }
        for k in record.keys {
            if record[k]! > alive {
                alive = record[k]!
                year = k
            }
            if record[k]! == alive {
                year = min(year, k)
            }
        }
        return year
    }
}

let b = [1972,1908,1915,1957,1960,1948,1912,1903,1949,1977,1900,1957,1934,1929,1913,1902,1903,1901]
let d = [1997,1932,1963,1997,1983,2000,1926,1962,1955,1997,1998,1989,1992,1975,1940,1903,1983,1969]

let solution = Solution()
let ans = solution.maxAliveYear(b, d)

//: [Next](@next)
