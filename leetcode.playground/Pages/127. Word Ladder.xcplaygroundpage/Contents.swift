//: [Previous](@previous)

/*
 
 127. Word Ladder
 
 Given two words (beginWord and endWord), and a dictionary's word list, find the length of shortest transformation sequence from beginWord to endWord, such that:

 Only one letter can be changed at a time.
 Each transformed word must exist in the word list.
 Note:

 Return 0 if there is no such transformation sequence.
 All words have the same length.
 All words contain only lowercase alphabetic characters.
 You may assume no duplicates in the word list.
 You may assume beginWord and endWord are non-empty and are not the same.
 Example 1:

 Input:
 beginWord = "hit",
 endWord = "cog",
 wordList = ["hot","dot","dog","lot","log","cog"]

 Output: 5

 Explanation: As one shortest transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog",
 return its length 5.
 Example 2:

 Input:
 beginWord = "hit"
 endWord = "cog"
 wordList = ["hot","dot","dog","lot","log"]

 Output: 0

 Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.
 
 */

/*
 
 class Solution {
     Map<String, Integer> wordId = new HashMap<String, Integer>();
     List<List<Integer>> edge = new ArrayList<List<Integer>>();
     int nodeNum = 0;

     public int ladderLength(String beginWord, String endWord, List<String> wordList) {
         for (String word : wordList) {
             addEdge(word);
         }
         addEdge(beginWord);
         if (!wordId.containsKey(endWord)) {
             return 0;
         }
         int[] dis = new int[nodeNum];
         Arrays.fill(dis, Integer.MAX_VALUE);
         int beginId = wordId.get(beginWord), endId = wordId.get(endWord);
         dis[beginId] = 0;

         Queue<Integer> que = new LinkedList<Integer>();
         que.offer(beginId);
         while (!que.isEmpty()) {
             int x = que.poll();
             if (x == endId) {
                 return dis[endId] / 2 + 1;
             }
             for (int it : edge.get(x)) {
                 if (dis[it] == Integer.MAX_VALUE) {
                     dis[it] = dis[x] + 1;
                     que.offer(it);
                 }
             }
         }
         return 0;
     }

     public void addEdge(String word) {
         addWord(word);
         int id1 = wordId.get(word);
         char[] array = word.toCharArray();
         int length = array.length;
         for (int i = 0; i < length; ++i) {
             char tmp = array[i];
             array[i] = '*';
             String newWord = new String(array);
             addWord(newWord);
             int id2 = wordId.get(newWord);
             edge.get(id1).add(id2);
             edge.get(id2).add(id1);
             array[i] = tmp;
         }
     }

     public void addWord(String word) {
         if (!wordId.containsKey(word)) {
             wordId.put(word, nodeNum++);
             edge.add(new ArrayList<Integer>());
         }
     }
 }

 作者：LeetCode-Solution
 链接：https://leetcode-cn.com/problems/word-ladder/solution/dan-ci-jie-long-by-leetcode-solution/
 来源：力扣（LeetCode）
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 
 */

class Solution {
    var edges: [String: [String]] = [:]
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        addEdge(beginWord)
        for word in wordList {
            addEdge(word)
        }
        if edges[endWord] == nil || edges[endWord]!.isEmpty {
            return 0
        }
        var currentWords = [beginWord], wordDict:[String: Int] = [:]
        for word in edges.keys {
            wordDict[word] = 0
        }
        while true {
            if wordDict[endWord]! > 0 {
                break
            }
            var temp = [String]()
            for currentWord in currentWords {
                let nexts = edges[currentWord]!
                for next in nexts {
                    if wordDict[next] == 0 {
                        wordDict[next] = wordDict[currentWord]! + 1
                        temp.append(next)
                    }
                }
            }
            if temp.isEmpty {
                return 0
            }
            currentWords = temp
        }
        return wordDict[endWord]!/2 + 1
    }
    
    func addEdge(_ word: String) {
        edges[word] = []
        for i in 0..<word.count {
            var virtual = Array(word)
            virtual.replaceSubrange(i..<i+1, with: [Character("*")])
            let vs = String(virtual)
            edges[word]?.append(vs)
            if edges[vs] == nil {
                edges[vs] = []
            }
            edges[vs]?.append(word)
        }
    }
    
    func exceededTime(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var wordDict = [String: Int]()
        for word in wordList {
            wordDict[word] = 0
        }
        guard wordDict[endWord] != nil else {
            return 0
        }
        var currentWords = [beginWord], steps = 1
        while wordDict[endWord] == 0 {
            for currentWord in currentWords {
                for key in wordDict.keys {
                    if wordDict[key]! == 0 && transferable(currentWord, key) {
                        wordDict[key] = steps + 1
                    }
                }
            }
            currentWords.removeAll()
            var advanced = false
            for key in wordDict.keys {
                if wordDict[key]! == steps + 1 {
                    advanced = true
                    currentWords.append(key)
                }
            }
            if advanced {
                steps = steps + 1
            } else {
                steps = 0
                break
            }
        }
        return steps
    }
    
    func transferable(_ word1: String, _ word2: String) -> Bool {
        var diffs = 0, count = word1.count
        for i in 0..<count {
            if Array(word1)[i] != Array(word2)[i] {
                diffs += 1
                if diffs > 1 {
                    return false
                }
            }
        }
        return diffs == 1
    }
}

let beginWord = "hit",
    endWord = "cog",
    wordList = ["hot","dot","dog","lot","log","cog"]
let solution = Solution()
let ans = solution.ladderLength(beginWord, endWord, wordList)
ans

//: [Next](@next)
