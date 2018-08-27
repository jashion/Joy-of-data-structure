//: Playground - noun: a place where people can play

import UIKit

public enum ErrorStatus {
    case Error(message: String)
    case OK
}

public class LinkedListNode<T> {
    var data: T  //Data could not be nil.
    var previous: LinkedListNode?  //The pointer to previous node.
    var next: LinkedListNode?  //The pointer to next node.
    init(_ data: T) {
        self.data = data
    }
}

public class DoubleLinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?  //Head node of link list.
    
    public var isEmpty: Bool {  //If link list has no data, return true.
        return head == nil
    }
    
    public var first: Node? {  //Get first node is the head of link list.
        return head
    }
    
    public var last: Node? {  //Last node of link list.
        if isEmpty {
            return nil
        }
        
        var node = head
        while let next = node?.next {
            node = next
        }
        return node
    }
    
    public var count: Int {  //Retrun link list's nodes count.
        if isEmpty {
            return 0
        }
        
        var count = 1
        var node = head
        while let next = node?.next {
            count += 1
            node = next
        }
        return count
    }
    
    public func node(atIndex index: Int) -> Node? {  //Get node with index
        guard index >= 0, index < count else {
            return nil
        }
        if isEmpty {
            return nil
        }
        if index == 0 {
            return first
        }

        var node = first
        for _ in 1...index {
            node = node?.next
            if node == nil {
                break
            }
        }
        return node
    }
    
    public func appendData(data: T) {  //Append data to link list tail
        let newNode = Node(data)
        if let lastNode = last {
            lastNode.next = newNode
            newNode.previous = lastNode
        } else {
            head = newNode
        }
    }
    
    public func insert(data: T, atIndex index: Int) -> ErrorStatus {  //Insert data at index
        guard index >= 0, index <= count else {
            return ErrorStatus.Error(message: "Index is out of range!")
        }
        let newNode = Node(data)
        if index == 0 {
            if let node = first {
                head = newNode
                newNode.next = node
                node.previous = newNode
            } else {
                head = newNode
            }
        } else {
            let node = self.node(atIndex: index-1)
            let nextNode = self.node(atIndex: index)
            node?.next = newNode
            newNode.previous = node
            newNode.next = nextNode
            nextNode?.previous = newNode
        }
        return ErrorStatus.OK
    }
    
    public func remove(atIndex index: Int) -> (T?, ErrorStatus) {  //Remove node at index
        guard !isEmpty else {
            return (nil, ErrorStatus.Error(message: "Link list is Empty!"))
        }
        
        guard index >= 0, index < count else {
            return (nil, ErrorStatus.Error(message: "Index is out of range!"))
        }
        
        let node = self.node(atIndex: index)
        let nextNode = self.node(atIndex: index+1)
        if index == 0 {
            head = nextNode
        } else {
            let beforeNode = self.node(atIndex: index-1)
            beforeNode?.next = nextNode
            nextNode?.previous = beforeNode
        }
        return (node?.data, ErrorStatus.OK)
    }
    
    public func remveLast() -> (T?, ErrorStatus) {  //Remove link list's last node
        return self.remove(atIndex: count-1)
    }
    
    public func removeAll() -> ErrorStatus {  //Remove link list all nodes
        head = nil
        return ErrorStatus.OK
    }
    
    public func printAllData() {  //Print link list all data
        guard var node = first else {
            print("Link list is empty!")
            return;
        }
        
        print(node.data)
        while let next = node.next {
            print(next.data)
            node = node.next!
        }
    }
    
    public func printData(atIndex index: Int) {
        guard let node = self.node(atIndex: index) else {
            return
        }
        
        print(node.data)
    }
}

let list = DoubleLinkedList<Int>()

for index in 0..<6 {
    list.appendData(data: index)
}

//list.printAllData()  //0, 1, 2, 3, 4, 5

list.insert(data: 6, atIndex: list.count)
//list.printAllData()  //0, 1, 2, 3, 4, 5, 6

list.insert(data: -1, atIndex: 0)
//list.printAllData()  //-1, 0, 1, 2, 3, 4, 5, 6

list.remveLast()
//list.printAllData()  //-1, 0, 1, 2, 3, 4, 5

list.remove(atIndex: 0)
//list.printAllData()  //0, 1, 2, 3, 4, 5

list.remove(atIndex: list.count-1)
//list.printAllData()  //0, 1, 2, 3, 4

list.removeAll()
//list.printAllData()  //Empty

//list.printData(atIndex: 5)

