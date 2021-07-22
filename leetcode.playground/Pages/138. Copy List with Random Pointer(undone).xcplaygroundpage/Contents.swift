//: [Previous](@previous)

/*
 
 138. Copy List with Random Pointer
 
 A linked list of length n is given such that each node contains an additional random pointer, which could point to any node in the list, or null.
 
 Construct a deep copy of the list. The deep copy should consist of exactly n brand new nodes, where each new node has its value set to the value of its corresponding original node. Both the next and random pointer of the new nodes should point to new nodes in the copied list such that the pointers in the original list and copied list represent the same list state. None of the pointers in the new list should point to nodes in the original list.
 
 For example, if there are two nodes X and Y in the original list, where X.random --> Y, then for the corresponding two nodes x and y in the copied list, x.random --> y.
 
 Return the head of the copied linked list.
 
 The linked list is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:
 
 val: an integer representing Node.val
 random_index: the index of the node (range from 0 to n-1) that the random pointer points to, or null if it does not point to any node.
 Your code will only be given the head of the original linked list.
 
 
 
 Example 1:
 
 
 Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
 Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]
 Example 2:
 
 
 Input: head = [[1,1],[2,1]]
 Output: [[1,1],[2,1]]
 Example 3:
 
 
 
 Input: head = [[3,null],[3,0],[3,null]]
 Output: [[3,null],[3,0],[3,null]]
 Example 4:
 
 Input: head = []
 Output: []
 Explanation: The given linked list is empty (null pointer), so return null.
 
 
 Constraints:
 
 0 <= n <= 1000
 -10000 <= Node.val <= 10000
 Node.random is null or is pointing to some node in the linked list.
 
 */


public class Node {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

/*
 
 class Solution {
 public:
 unordered_map<Node*, Node*> cachedNode;
 
 Node* copyRandomList(Node* head) {
 if (head == nullptr) {
 return nullptr;
 }
 if (!cachedNode.count(head)) {
 Node* headNew = new Node(head->val);
 cachedNode[head] = headNew;
 headNew->next = copyRandomList(head->next);
 headNew->random = copyRandomList(head->random);
 }
 return cachedNode[head];
 }
 };\
 
 */

class Solution {
    
    
    private var nodeDict: [String: Node] = [:]
    
    func copyRandomList(_ head: Node?) -> Node? {
        guard head != nil else {
            return nil
        }
        if nodeDict["\(head!)"] == nil {
            let node = Node(head!.val)
            
            nodeDict["\(node)"] = node
            node.next = copyRandomList(head?.next)
            node.random = copyRandomList(head?.random)
        }
        return nodeDict["\(head!)"]
    }
    
    func stupid(_ head: Node?) -> Node? {
        guard head != nil else {
            return nil
        }
        var originNode = head, sentry = Node(0), curNode = sentry, nodeDict: [Int: Node] = [:]
        sentry.next = Node(originNode!.val)
        curNode = curNode.next!
        nodeDict[curNode.val] = curNode
        while originNode != nil {
            if let originRandom = originNode?.random {
                if let random = nodeDict[originRandom.val] {
                    curNode.random = random
                } else {
                    let random = Node(originRandom.val)
                    curNode.random = random
                    nodeDict[random.val] = random
                }
            }
            originNode = originNode?.next
            if let origin = originNode {
                if let storeNode = nodeDict[origin.val] {
                    curNode.next = storeNode
                    break
                } else {
                    let nextNode = Node(origin.val)
                    curNode.next = nextNode
                    nodeDict[nextNode.val] = nextNode
                }
                curNode = curNode.next!
            }
        }
        return sentry.next
    }
}

//: [Next](@next)
