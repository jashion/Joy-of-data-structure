//: Playground - noun: a place where people can play

import UIKit

//单链表
public enum ErrorStatus {
    case Error(message: String)
    case OK
}

public class LinkedListNode<T>: NSObject {
    var data: T?
    var next: LinkedListNode<T>?
    init(_ data: T) {
        self.data = data
    }
    override init() {
    }
}

public class LinkedList<T>: NSObject {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node = Node()  //head node that has no data just a signal
    
    public var isEmpty: Bool {  //When the link list is empty which has no data return true
        return first == nil
    }
    
    //Link list nodes number, but not include head
    public var count: Int {
        guard var node = first else {
            return 0
        }
        
        var count = 1
        while let next = node.next {
            count = count + 1
            node = next
        }
        return count
    }
    
    //Get the first node that always is head's next
    public var first: Node? {
        return head.next
    }
    
    //Get the link list last node
    public var last: Node? {
        guard var node = first else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    //Get node with index
    public func node(atIndex index: Int) -> Node? {
        if index == 0 {
            return first
        } else {
            guard index < count else {
                return nil
            }
            
            var node: Node? = first?.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node
        }
    }
    
    //Append data to link list tail
    public func appendData(data: T) {
        let newNode = Node(data)
        if let lastNode = last {
            lastNode.next = newNode
        } else {
            head.next = newNode
        }
    }
    
    //Insert data at index
    public func insert(data: T, atIndex index: Int) -> ErrorStatus {
        guard index >= 0, index <= count else {
            return ErrorStatus.Error(message: "Index is out of range!")
        }
        let newNode = Node(data)
        if index == 0 {
            if let node = first {
                head.next = newNode
                newNode.next = node
            } else {
                head.next = newNode
            }
        } else if (index == count) {
            self.appendData(data: data)
        } else {
            let node = self.node(atIndex: index-1)
            let nextNode = self.node(atIndex: index)
            node?.next = newNode
            newNode.next = nextNode
        }
        return ErrorStatus.OK
    }
    
    //Remove node at index
    public func remove(atIndex index: Int) -> (T?, ErrorStatus) {
        guard !isEmpty else {
            return (nil, ErrorStatus.Error(message: "Link list is Empty!"))
        }
        
        guard index >= 0, index < count else {
            return (nil, ErrorStatus.Error(message: "Index is out of range!"))
        }
        
        let node = self.node(atIndex: index)
        let nextNode = self.node(atIndex: index+1)
        if index == 0 {
            head.next = nextNode
        } else {
            let beforeNode = self.node(atIndex: index-1)
            beforeNode?.next = nextNode
        }
        return (node?.data, ErrorStatus.OK)
    }
    
    //Remove link list's last node
    public func remveLast() -> (T?, ErrorStatus) {
        return self.remove(atIndex: count-1)
    }
    
    //Remove link list all nodes
    public func removeAll() -> ErrorStatus {
        head.next = nil
        return ErrorStatus.OK
    }
    
    //Print link list all data
    public func printAllData() {
        guard var node = first else {
            print("Link list is empty!")
            return;
        }
        
        print(node.data ?? T.self)
        while let next = node.next {
            print(next.data ?? T.self)
            node = node.next!
        }
    }
}

let list = LinkedList<String>()

for index in 0..<6 {
    list.appendData(data: "\(index)")
}

//list.printAllData()  //0, 1, 2, 3, 4, 5

list.insert(data: "6", atIndex: list.count)
//list.printAllData()  //0, 1, 2, 3, 4, 5, 6

list.insert(data: "-1", atIndex: 0)
//list.printAllData()  //-1, 0, 1, 2, 3, 4, 5, 6

list.remveLast()
//list.printAllData()  //-1, 0, 1, 2, 3, 4, 5

list.remove(atIndex: 0)
//list.printAllData()  //0, 1, 2, 3, 4, 5

list.remove(atIndex: list.count-1)
//list.printAllData()  //0, 1, 2, 3, 4

list.removeAll()
//list.printAllData()  //Empty
