//: Playground - noun: a place where people can play

import UIKit

extension Int {
    static func += (left: inout Int, right: Int) {
        left = left + right
    }
    
    static func -= (left: inout Int, right: Int) {
        left = left - right
    }
}

//边表结点
class EdgeNode {
    var adjex = 0
    var weight = 1
    var next: EdgeNode?
}

//顶点表结点
class VertexNode {
    var inEdge = 0
    var data = 0
    var firstEdge: EdgeNode?
}

class GraphAdjList {
    var adjList: [VertexNode] = []
    var numEdges = 0
    var numVertexes : Int {
        return adjList.count
    }
}

let graphiAdjList = GraphAdjList()

//V0
let v0 = VertexNode()
v0.inEdge = 0
v0.data = 0

let v0E11 = EdgeNode()
v0E11.adjex = 11
let v0E5 = EdgeNode()
v0E5.adjex = 5
let v0E4 = EdgeNode()
v0E4.adjex = 4

v0.firstEdge = v0E11
v0E11.next = v0E5
v0E5.next = v0E4

//V1
let v1 = VertexNode()
v1.inEdge = 0
v1.data = 1

let v1E8 = EdgeNode()
v1E8.adjex = 8
let v1E4 = EdgeNode()
v1E4.adjex = 4
let v1E2 = EdgeNode()
v1E2.adjex = 2

v1.firstEdge = v1E8
v1E8.next = v1E4
v1E4.next = v1E2

//V2
let v2 = VertexNode()
v2.inEdge = 2
v2.data = 2

let v2E9 = EdgeNode()
v2E9.adjex = 9
let v2E6 = EdgeNode()
v2E6.adjex = 6
let v2E5 = EdgeNode()
v2E5.adjex = 5

v2.firstEdge = v2E9
v2E9.next = v2E6
v2E6.next = v2E5

//V3
let v3 = VertexNode()
v3.inEdge = 0
v3.data = 3

let v3E13 = EdgeNode()
v3E13.adjex = 13
let v3E2 = EdgeNode()
v3E2.adjex = 2

v3.firstEdge = v3E13
v3E13.next = v3E2

//V4
let v4 = VertexNode()
v4.inEdge = 2
v4.data = 4

let v4E7 = EdgeNode()
v4E7.adjex = 7

v4.firstEdge = v4E7

//V5
let v5 = VertexNode()
v5.inEdge = 3
v5.data = 5

let v5E12 = EdgeNode()
v5E12.adjex = 12
let v5E8 = EdgeNode()
v5E8.adjex = 8

v5.firstEdge = v5E12
v5E12.next = v5E8

//V6
let v6 = VertexNode()
v6.inEdge = 1
v6.data = 6

let v6E5 = EdgeNode()
v6E5.adjex = 5

v6.firstEdge = v6E5

//V7
let v7 = VertexNode()
v7.inEdge = 2
v7.data = 7

//V8
let v8 = VertexNode()
v8.inEdge = 2
v8.data = 8

let v8E7 = EdgeNode()
v8E7.adjex = 7

v8.firstEdge = v8E7

//V9
let v9 = VertexNode()
v9.inEdge = 2
v9.data = 9

let v9E11 = EdgeNode()
v9E11.adjex = 11
let v9E10 = EdgeNode()
v9E10.adjex = 10

v9.firstEdge = v9E11
v9E11.next = v9E10

//V10
let v10 = VertexNode()
v10.inEdge = 1
v10.data = 10

let v10E13 = EdgeNode()
v10E13.adjex = 13

v10.firstEdge = v10E13

//V11
let v11 = VertexNode()
v11.inEdge = 2
v11.data = 11

//V12
let v12 = VertexNode()
v12.inEdge = 1
v12.data = 12

let v12E9 = EdgeNode()
v12E9.adjex = 9

v12.firstEdge = v12E9

//V13
let v13 = VertexNode()
v13.inEdge = 2
v13.data = 13

graphiAdjList.adjList.append(v0)
graphiAdjList.adjList.append(v1)
graphiAdjList.adjList.append(v2)
graphiAdjList.adjList.append(v3)
graphiAdjList.adjList.append(v4)
graphiAdjList.adjList.append(v5)
graphiAdjList.adjList.append(v6)
graphiAdjList.adjList.append(v7)
graphiAdjList.adjList.append(v8)
graphiAdjList.adjList.append(v9)
graphiAdjList.adjList.append(v10)
graphiAdjList.adjList.append(v11)
graphiAdjList.adjList.append(v12)
graphiAdjList.adjList.append(v13)

func toPologicalSort(gl: GraphAdjList) {
    var count = 0, top = 0, k = 0, getTop = 0
    var stack: [Int] = []
    //将有向图所有入度为0的顶点入栈
    for i in 0..<gl.numVertexes {
        if gl.adjList[i].inEdge == 0 {
            stack.append(i)
            top += 1
        }
    }
    //开始算拓扑序列
    while top != 0 {
        getTop = stack.removeLast()
        top -= 1
        print("vertex: \(gl.adjList[getTop].data)")
        count += 1
        var edgeNode = gl.adjList[getTop].firstEdge
        while edgeNode != nil {
            k = (edgeNode?.adjex)!
            gl.adjList[k].inEdge -= 1
            if gl.adjList[k].inEdge == 0 {
                stack.append(k)
                top += 1
            }
            edgeNode = edgeNode?.next
        }
    }
    
    if count < gl.numVertexes {
        print("Error")
    } else {
        print("OK")
    }
}

toPologicalSort(gl: graphiAdjList)
