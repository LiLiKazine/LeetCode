//: [Previous](@previous)

/*
 
 面试题 03.06. Animal Shelter LCCI
 
 An animal shelter, which holds only dogs and cats, operates on a strictly"first in, first out" basis. People must adopt either the"oldest" (based on arrival time) of all animals at the shelter, or they can select whether they would prefer a dog or a cat (and will receive the oldest animal of that type). They cannot select which specific animal they would like. Create the data structures to maintain this system and implement operations such as enqueue, dequeueAny, dequeueDog, and dequeueCat. You may use the built-in Linked list data structure.

 enqueue method has a animal parameter, animal[0] represents the number of the animal, animal[1] represents the type of the animal, 0 for cat and 1 for dog.

 dequeue* method returns [animal number, animal type], if there's no animal that can be adopted, return [-1, -1].

 Example1:

  Input:
 ["AnimalShelf", "enqueue", "enqueue", "dequeueCat", "dequeueDog", "dequeueAny"]
 [[], [[0, 0]], [[1, 0]], [], [], []]
  Output:
 [null,null,null,[0,0],[-1,-1],[1,0]]
 Example2:

  Input:
 ["AnimalShelf", "enqueue", "enqueue", "enqueue", "dequeueDog", "dequeueCat", "dequeueAny"]
 [[], [[0, 0]], [[1, 0]], [[2, 1]], [], [], []]
  Output:
 [null,null,null,null,[2,1],[0,0],[1,0]]
 Note:

 The number of animals in the shelter will not exceed 20000.
 
 */

class AnimalShelf {
    
    private var queue: [[Int]]

    init() {
        queue = []
    }
    
    func enqueue(_ animal: [Int]) {
        queue.append(animal)
    }
    
    func dequeueAny() -> [Int] {
        guard !queue.isEmpty else {
            return [-1, -1]
        }
        return queue.removeFirst()
    }
    
    func dequeueDog() -> [Int] {
        var i = 0
        while i < queue.count {
            if queue[i][1] == 1 {
                return queue.remove(at: i)
            }
            i+=1
        }
        return [-1, -1]
    }
    
    func dequeueCat() -> [Int] {
        var i = 0
        while i < queue.count {
            if queue[i][1] == 0 {
                return queue.remove(at: i)
            }
            i+=1
        }
        return [-1, -1]
    }
}

/**
 * Your AnimalShelf object will be instantiated and called as such:
 * let obj = AnimalShelf()
 * obj.enqueue(animal)
 * let ret_2: [Int] = obj.dequeueAny()
 * let ret_3: [Int] = obj.dequeueDog()
 * let ret_4: [Int] = obj.dequeueCat()
 */

//: [Next](@next)
