//: [Previous](@previous)

/*
 707. Design Linked List
 中等
 Design your implementation of the linked list. You can choose to use a singly or doubly linked list.
 A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node.
 If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.

 Implement the MyLinkedList class:

 MyLinkedList() Initializes the MyLinkedList object.
 int get(int index) Get the value of the indexth node in the linked list. If the index is invalid, return -1.
 void addAtHead(int val) Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
 void addAtTail(int val) Append a node of value val as the last element of the linked list.
 void addAtIndex(int index, int val) Add a node of value val before the indexth node in the linked list. If index equals the length of the linked list, the node will be appended to the end of the linked list. If index is greater than the length, the node will not be inserted.
 void deleteAtIndex(int index) Delete the indexth node in the linked list, if the index is valid.
  

 Example 1:

 Input
 ["MyLinkedList", "addAtHead", "addAtTail", "addAtIndex", "get", "deleteAtIndex", "get"]
 [[], [1], [3], [1, 2], [1], [1], [1]]
 Output
 [null, null, null, null, 2, null, 3]

 Explanation
 MyLinkedList myLinkedList = new MyLinkedList();
 myLinkedList.addAtHead(1);
 myLinkedList.addAtTail(3);
 myLinkedList.addAtIndex(1, 2);    // linked list becomes 1->2->3
 myLinkedList.get(1);              // return 2
 myLinkedList.deleteAtIndex(1);    // now the linked list is 1->3
 myLinkedList.get(1);              // return 3
  

 Constraints:

 0 <= index, val <= 1000
 Please do not use the built-in LinkedList library.
 At most 2000 calls will be made to get, addAtHead, addAtTail, addAtIndex and deleteAtIndex.
 */

import Foundation


class MyLinkedList {
    
    class ListNode {
        var val: Int
        var next: ListNode?
        init(val: Int, next: ListNode? = nil) {
            self.val = val
            self.next = next
        }
    }
    
    let sentry: ListNode
    var tail: ListNode
    
    init() {
        let dummy = ListNode(val: 0)
        sentry = dummy
        tail = dummy
    }
    
    func get(_ index: Int) -> Int {
        var cur = sentry.next
        for _ in 0..<index {
            cur = cur?.next
        }
        guard let cur else { return -1 }
        return cur.val
    }
    
    func addAtHead(_ val: Int) {
        let nxt = sentry.next
        sentry.next = ListNode(val: val, next: nxt)
        if tail === sentry {
            tail = sentry.next!
        }
    }
    
    func addAtTail(_ val: Int) {
        tail.next = ListNode(val: val)
        tail = tail.next!
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        var cur: ListNode? = sentry
        for _ in 0..<index {
            cur = cur?.next
        }
        guard let cur else { return }
        if cur === tail {
            addAtTail(val)
        } else {
            let nxt = cur.next
            cur.next = ListNode(val: val, next: nxt)
        }
    }
    
    func deleteAtIndex(_ index: Int) {
        var cur: ListNode? = sentry
        for _ in 0..<index {
            cur = cur?.next
        }
        guard let cur else { return }
        if cur.next === tail {
            tail = cur
        }
        cur.next = cur.next?.next
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */

//: [Next](@next)
