//: [Previous](@previous)

/*
 
 917. Reverse Only Letters
 
 Given a string S, return the "reversed" string where all characters that are not a letter stay in the same place, and all letters reverse their positions.

  

 Example 1:

 Input: "ab-cd"
 Output: "dc-ba"
 Example 2:

 Input: "a-bC-dEf-ghIj"
 Output: "j-Ih-gfE-dCba"
 Example 3:

 Input: "Test1ng-Leet=code-Q!"
 Output: "Qedo1ct-eeLg=ntse-T!"
  

 Note:

 S.length <= 100
 33 <= S[i].ASCIIcode <= 122
 S doesn't contain \ or "
 
 */

class Solution {
    func reverseOnlyLetters(_ S: String) -> String {
        
        var charSet = Array<Character>(S)
        guard charSet.count > 0 else {
            return S
        }
        var i = 0, j = charSet.count-1
        while i < j {
            while !isLetter(charSet[i]) {
                if i >= j {
                    break
                }
                i+=1
            }
            while !isLetter(charSet[j]) {
                if i >= j {
                    break
                }
                j-=1
            }
            
            let c = charSet[i]
            charSet[i] = charSet[j]
            charSet[j] = c
            i+=1
            j-=1
        }
        return String(charSet)
    }
    
    func isLetter(_ c: Character) -> Bool {
        guard c.isASCII else { return false }
        let ascii = c.asciiValue!
        return (65 <= ascii && ascii <= 90) || (97 <= ascii && ascii <= 122)
    }
}

let input = "Test1ng-Leet=code-Q!"

let solution = Solution()
let ans = solution.reverseOnlyLetters(input)

//: [Next](@next)
