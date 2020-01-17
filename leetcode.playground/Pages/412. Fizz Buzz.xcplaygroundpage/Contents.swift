//: [Previous](@previous)

/*
 412. Fizz Buzz
 Easy

 Write a program that outputs the string representation of numbers from 1 to n.

 But for multiples of three it should output “Fizz” instead of the number and for the multiples of five output “Buzz”. For numbers which are multiples of both three and five output “FizzBuzz”.

 Example:

 n = 15,

 Return:
 [
     "1",
     "2",
     "Fizz",
     "4",
     "Buzz",
     "Fizz",
     "7",
     "8",
     "Fizz",
     "Buzz",
     "11",
     "Fizz",
     "13",
     "14",
     "FizzBuzz"
 ]

 */

import Foundation

class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        var res: [String] = []
        for i in 1...n {
            if i % 3 == 0 && i % 5 == 0 {
                res.append("FizzBuzz")
            } else if i % 3 == 0 {
                res.append("Fizz")
            } else if i % 5 == 0 {
                res.append("Buzz")
            } else {
                res.append(i.description)
            }
        }
        return res
    }
}

//: [Next](@next)
