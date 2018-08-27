//: Playground - noun: a place where people can play

import UIKit

public struct Stack<T> {
    private var stackData: [T] = []
    
    public var count: Int {
        return stackData.count
    }
    
    public var top: T? {
        if isEmpty {
            return nil
        } else {
            return stackData.last
        }
    }
    
    public var isEmpty: Bool {
        return stackData.isEmpty
    }
    
    public mutating func push(data: T) {
        stackData.append(data)
    }
    
    public mutating func pop() -> T? {
        if isEmpty {
            return nil
        } else {
            return stackData.removeLast()
        }
    }
    
    public mutating func removeAll() {
        stackData.removeAll()
    }
    
    public func printAllData() {
        for item in stackData {
            print(item)
        }
    }
}

var stack = Stack<Int>()
stack.top

for index in 0..<5 {
    stack.push(data: index)
}

//stack.printAllData()

stack.pop()
//stack.printAllData()

stack.top
//stack.printAllData()

stack.removeAll()
//stack.printAllData()

stack.top

//stack.printAllData()


public struct Queue<T> {
    private var queueData: [T] = []
    
    public var front: T? {
        return queueData.first
    }
    
    public var isEmpty: Bool {
        return queueData.isEmpty
    }
    
    public var count: Int {
        return queueData.count
    }
    
    public mutating func enQueue(_ data: T) {
        queueData.append(data)
    }
    
    public mutating func deQueue() -> T? {
        if isEmpty {
            return nil
        } else {
            return queueData.removeFirst()
        }
    }
    
    public mutating func removeAll() {
        queueData.removeAll()
    }
    
    public func printAllData() {
        for value in queueData {
            print(value)
        }
    }
}

let exp = ["9", "+", "(", "3", "-", "1", ")", "*", "3", "+", "10", "/", "4"]

enum OperationPriority: String {
    case multi = "*"
    case divide = "/"
    case add = "+"
    case sub = "-"
    
    var intValue: Int {
        switch self {
        case .multi,.divide:
            return 1
        case .add, .sub:
            return 0
        }
    }
    
    func result(operator1: String, operator2: String) -> Int {
        switch self {
        case .multi:
            return Int(operator1)!*Int(operator2)!
        case .divide:
            return Int(operator1)!/Int(operator2)!
        case .add:
            return Int(operator1)!+Int(operator2)!
        case .sub:
            return Int(operator1)!-Int(operator2)!
        }
    }
}

func suffixExpFromMiddleExp(exps: Array<String>) -> Array<String>{
    var suffixExp: [String] = Array()
    var stack = Stack<String>()
    let predicate = NSPredicate.init(format: "SELF MATCHES %@", "^[0-9]*$")
    for value in exps {
        if predicate.evaluate(with: value) {
            suffixExp.append(value)
        } else if value == "(" {
            stack.push(data: value)
        } else if value == ")" {
            while stack.top != "(" {
                suffixExp.append(stack.pop() ?? "")
            }
            if stack.top == "(" {
                stack.pop()
            }
        } else {
            //value <= top, stack.pop;value > top, stack.push
            let advantage = OperationPriority.init(rawValue: value)?.intValue ?? 0
            var topAdvantage: Int = 0
            while let top = stack.top, top != "(" {
                topAdvantage = OperationPriority.init(rawValue: top)?.intValue ?? 0
                if advantage > topAdvantage {
                    break
                } else {
                    suffixExp.append(top)
                    stack.pop()
                }
            }
            stack.push(data: value)
        }
    }
    while let top = stack.top {
        suffixExp.append(top)
        stack.pop()
    }
    return suffixExp
}

let suffixExps = suffixExpFromMiddleExp(exps: exp)

func mathOperation(exps: Array<String>) -> Int {
    var result = 0
    var stack = Stack<String>()
    let predicate = NSPredicate.init(format: "SELF MATCHES %@", "^[0-9]*$")
    for value in exps {
        if predicate.evaluate(with: value) {
            stack.push(data: value)
        } else {
            let operator2 = stack.pop()
            let operator1 = stack.pop()
            let temp = (OperationPriority.init(rawValue: value)?.result(operator1: operator1!, operator2: operator2!))!
            stack.push(data: "\(temp)")
        }
    }
    if let resultStr = stack.pop() {
        result = Int(resultStr)!
    }
    return result
}

let result = mathOperation(exps: suffixExps)
print(result)
