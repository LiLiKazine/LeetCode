//: [Previous](@previous)

/*
 
 面试题 05.02. Binary Number to String LCCI
 
 Given a real number between 0 and 1 (e.g., 0.72) that is passed in as a double, print the binary representation. If the number cannot be represented accurately in binary with at most 32 characters, print "ERROR".

 Example1:

  Input: 0.625
  Output: "0.101"
 Example2:

  Input: 0.1
  Output: "ERROR"
  Note: 0.1 cannot be represented accurately in binary.
 Note:

 This two charaters "0." should be counted into 32 characters.
 The number of decimal places for num is at most 6 digits
 
 */
/*
 
 class Solution {
     public String printBin(double num) {
         StringBuilder sb = new StringBuilder("0.");
         while (sb.length() <= 32 && num != 0) {
             num *= 2;
             int digit = (int) num;
             sb.append(digit);
             num -= digit;
         }
         return sb.length() <= 32 ? sb.toString() : "ERROR";
     }
 }
 
 */
class Solution {
    func printBin(_ num: Double) -> String {
        
        var ans: String = "", num = num
//        while ans.count <= 32 && num != 0 {
//            num *= 2
//            let digit = Int(Double(num)!)
//
//        }
//
        return ""
    }
}



//: [Next](@next)
