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

//V0
let v0 = VertexNode()
v0.inEdge = 0
v0.data = 0

let v0E2 = EdgeNode()
v0E2.adjex = 2
v0E2.weight = 4
let v0E1 = EdgeNode()
v0E1.adjex = 1
v0E1.weight = 3

v0.firstEdge = v0E2
v0E2.next = v0E1

//V1
let v1 = VertexNode()
v1.inEdge = 1
v1.data = 1

let v1E4 = EdgeNode()
v1E4.adjex = 4
v1E4.weight = 6
let v1E3 = EdgeNode()
v1E3.adjex = 3
v1E3.weight = 5

v1.firstEdge = v1E4
v1E4.next = v1E3

//V2
let v2 = VertexNode()
v2.inEdge = 1
v2.data = 2

let v2E5 = EdgeNode()
v2E5.adjex = 5
v2E5.weight = 7
let v2E3 = EdgeNode()
v2E3.adjex = 3
v2E3.weight = 8

v2.firstEdge = v2E5
v2E5.next = v2E3

//V3
let v3 = VertexNode()
v3.inEdge = 2
v3.data = 3

let v3E4 = EdgeNode()
v3E4.adjex = 4
v3E4.weight = 3

v3.firstEdge = v3E4

//V4
let v4 = VertexNode()
v4.inEdge = 2
v4.data = 4

let v4E7 = EdgeNode()
v4E7.adjex = 7
v4E7.weight = 4
let v4E6 = EdgeNode()
v4E6.adjex = 6
v4E6.weight = 9

v4.firstEdge = v4E7
v4E7.next = v4E6

//V5
let v5 = VertexNode()
v5.inEdge = 1
v5.data = 5

let v5E7 = EdgeNode()
v5E7.adjex = 7
v5E7.weight = 6

v5.firstEdge = v5E7

//V6
let v6 = VertexNode()
v6.inEdge = 1
v6.data = 6

let v6E9 = EdgeNode()
v6E9.adjex = 9
v6E9.weight = 2

v6.firstEdge = v6E9

//V7
let v7 = VertexNode()
v7.inEdge = 2
v7.data = 7

let v7E8 = EdgeNode()
v7E8.adjex = 8
v7E8.weight = 5

v7.firstEdge = v7E8

//V8
let v8 = VertexNode()
v8.inEdge = 1
v8.data = 8

let v8E9 = EdgeNode()
v8E9.adjex = 9
v8E9.weight = 3

v8.firstEdge = v8E9

//V9
let v9 = VertexNode()
v9.inEdge = 2
v9.data = 9

let graphiAdjList = GraphAdjList()

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

//etv(earliest time of vertex) => 顶点V的最早发生时间
//ltv(latest time of vertex) => 顶点V的最迟发生时间
//ete(earliest time of edge) => 弧a的最早发生时间
//lte(latest time of edge) => 弧a的最迟发生时间

var etv: [Int] = Array(repeating: 0, count: graphiAdjList.numVertexes)
var ltv: [Int] = []
var stack2: [Int] = []
var top2 = 0

func TopologicalSort(gl: GraphAdjList) {
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
        count += 1
        //
        stack2.append(getTop)
        top2 += 1
        //
        var edgeNode = gl.adjList[getTop].firstEdge
        while edgeNode != nil {
            k = (edgeNode?.adjex)!
            gl.adjList[k].inEdge -= 1
            if gl.adjList[k].inEdge == 0 {
                stack.append(k)
                top += 1
            }
            //
            if etv[getTop]+(edgeNode?.weight)! > etv[k] {
                etv[k] = etv[getTop]+(edgeNode?.weight)!
            }
            //
            edgeNode = edgeNode?.next
        }
    }
    
    if count < gl.numVertexes {
        print("Error")
    } else {
        print("OK")
    }
}

func CriticalPath(gl: GraphAdjList) {
    var getTop = 0, k = 0
    var ete = 0, lte = 0
    TopologicalSort(gl: gl)  //求拓扑序列，计算数组etv和stack2
    for _ in 0..<gl.numVertexes {
        ltv.append(etv[gl.numVertexes-1])
    }
    while top2 != 0 {
        getTop = stack2.removeLast()
        top2 -= 1
        var edgeNode = gl.adjList[getTop].firstEdge
        while edgeNode != nil {
            k = (edgeNode?.adjex)!
            if ltv[k]-(edgeNode?.weight)! < ltv[getTop] {
                ltv[getTop] = ltv[k]-(edgeNode?.weight)!
            }
            edgeNode = edgeNode?.next
        }
    }
    for j in 0..<gl.numVertexes {
        var edgeNode = gl.adjList[j].firstEdge
        while edgeNode != nil {
            k = (edgeNode?.adjex)!
            ete = etv[j]
            lte = ltv[k]-(edgeNode?.weight)!
            if ete == lte {
                print("<\(gl.adjList[j].data), \(gl.adjList[k].data) length: \((edgeNode?.weight)!)>")
            }
            edgeNode = edgeNode?.next
        }
    }
}

CriticalPath(gl: graphiAdjList)
//TopologicalSort(gl: graphiAdjList)
//print(etv)
//print(stack2)
