//: Playground - noun: a place where people can play

import UIKit

//struct PTNode<T> {
//    var data: T
//    var parent: Int = -1
//    init(_ data: T) {
//        self.data = data
//    }
//}
//
//struct PTree<T> {
//    var nodes: [PTNode<T>] = []
//    var root = 0  //根的位置
//    var n: Int {  //结点数
//        return nodes.count
//    }
//
//    mutating func insertData(_ data: T, parent: Int) {
//        var node = PTNode<T>(data)
//        node.parent = parent
//        if parent == -1 {
//            nodes.insert(node, at: 0)
//        } else {
//            nodes.append(node)
//        }
//    }
//
//    func printTree() {
//        guard !nodes.isEmpty else {
//            return
//        }
//
//        for (index, value) in nodes.enumerated() {
//            print("\(index) -> \(value.data) -> \(value.parent)")
//        }
//    }
//}

//var tree = PTree<String>()
//tree.insertData("A", parent: -1)
//tree.insertData("B", parent: 0)
//tree.insertData("C", parent: 0)
//tree.insertData("D", parent: 1)
//tree.insertData("E", parent: 2)
//tree.insertData("F", parent: 2)
//tree.insertData("G", parent: 3)
//tree.insertData("H", parent: 3)
//tree.insertData("I", parent: 3)
//tree.insertData("J", parent: 4)
//
//tree.printTree()

class BinTNode<T>: NSObject {
    let data: T
    var lChild: BinTNode<T>?
    var rChild: BinTNode<T>?
    var lTag: Bool = false
    var rTag: Bool = false
    init(_ data: T) {
        self.data = data
    }
}
//class BinTNode<T>: NSObject{
//    var data: T
//    var lChild: BinTNode<T>?
//    var rChild: BinTNode<T>?
//    init(_ data: T) {
//        self.data = data
//    }
//}
//
let rootNode = BinTNode<String>("A")  //Root
let bNode = BinTNode<String>("B")
let cNode = BinTNode<String>("C")
let dNode = BinTNode<String>("D")
let eNode = BinTNode<String>("E")
let fNode = BinTNode<String>("F")
let gNode = BinTNode<String>("G")
let hNode = BinTNode<String>("H")
let iNode = BinTNode<String>("I")
let jNode = BinTNode<String>("J")

rootNode.lChild = bNode
rootNode.rChild = cNode

bNode.lChild = dNode
bNode.rChild = eNode

cNode.lChild = fNode
cNode.rChild = gNode

dNode.lChild = hNode
dNode.rChild = iNode

eNode.lChild = jNode
//
////前序遍历
//func preOrderTraverse(t: BinTNode<String>?) {
//    guard let tNode = t else {
//        return
//    }
//
//    print(tNode.data)
//    preOrderTraverse(t: tNode.lChild)
//    preOrderTraverse(t: tNode.rChild)
//}
////中序遍历
//func inOrderTraverse(t: BinTNode<String>?) {
//    guard let tNode = t else {
//        return
//    }
//    inOrderTraverse(t: tNode.lChild)
//    print(tNode.data)
//    inOrderTraverse(t: tNode.rChild)
//}
////后序遍历
//func postOrderTraverse(t: BinTNode<String>?) {
//    guard let tNode = t else {
//        return
//    }
//    postOrderTraverse(t: tNode.lChild)
//    postOrderTraverse(t: tNode.rChild)
//    print(tNode.data)
//}
//
////层序遍历
//func layerOrderTraverse(t: BinTNode<String>?) {
//    guard let tNode = t else {
//        return
//    }
//
//    var array: [BinTNode<String>] = [tNode]
//    while !array.isEmpty {
//        let count = array.count
//        for i in 0...count-1 {
//            let node = array[i]
//            print(node.data)
//            if let lNode = node.lChild {
//                array.append(lNode)
//            }
//            if let rNode = node.rChild {
//                array.append(rNode)
//            }
//        }
//        array.removeSubrange(Range.init(NSRange(location: 0, length: count))!)
//    }
//}
//
//layerOrderTraverse(t: rootNode)

var pre: BinTNode<String>?

func inThreading(p: BinTNode<String>?) {
    if let tNode = p {
        inThreading(p: tNode.lChild)
        if tNode.lChild == nil {
            tNode.lTag = true
            tNode.lChild = pre
        }
        if pre?.rChild == nil {
            pre?.rTag = true
            pre?.rChild = tNode
        }
        pre = tNode
        inThreading(p: tNode.rChild)
    }
}

inThreading(p: rootNode)


let top = BinTNode<String>("")

hNode.lTag = true
hNode.lChild = top

top.lChild = rootNode

top.rTag = true
top.rChild = gNode

gNode.rTag = true
gNode.rChild = top

func inOrderTraverse_Thread(t: BinTNode<String>?) {
    var p = t?.lChild
    while p != t {
        while p?.lTag == false {
            p = p?.lChild
        }
        print(p?.data ?? "")
        while p?.rChild != t, p?.rTag == true {
            p = p?.rChild
            print(p?.data ?? "")
        }
        p = p?.rChild
    }
}

inOrderTraverse_Thread(t: top)
