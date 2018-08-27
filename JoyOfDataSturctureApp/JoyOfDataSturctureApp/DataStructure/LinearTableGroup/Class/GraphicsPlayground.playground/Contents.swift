//: Playground - noun: a place where people can play

import UIKit

extension Int {
    static func += (left: inout Int, right: Int) {
        left = left + right
    }
}

////邻接矩阵
//public struct Graph<T: Equatable> {
//    var vexs: [T] = []
//    var arc: [[Int]] = []
//    public var vertexes: Int {
//        return vexs.count
//    }
//    public var edges: Int {
//        var count = 0
//        for items in arc {
//            for item in items {
//                if item > 0 {
//                    count += 1
//                }
//            }
//        }
//        return count
//    }
//
//    public mutating func addVertex(vertext: T) {
//        vexs.append(vertext)
//        for i in 0..<arc.count {
//            var temp = arc[i]
//            temp.append(0)
//            arc[i] = temp
//        }
//
//        let newArray = Array(repeating: 0, count: arc.count+1)
//        arc.append(newArray)
//    }
//
//    public mutating func addEdge(from top1: T, to top2: T) {
//        let containTop1 = vexs.contains { $0 == top1 }
//        let containTop2 = vexs.contains { $0 == top2 }
//
//        guard containTop1, containTop2 else {
//            return
//        }
//
//        let row = vexs.index(of: top1)!
//        let column = vexs.index(of: top2)!
//        arc[row][column] = 1
//        arc[column][row] = 1
//    }
//}
//
//var graphics = Graph<String>()
//graphics.addVertex(vertext: "A")
//graphics.addVertex(vertext: "B")
//graphics.addVertex(vertext: "C")
//graphics.addVertex(vertext: "D")
//graphics.addVertex(vertext: "E")
//graphics.addVertex(vertext: "F")
//graphics.addVertex(vertext: "G")
//graphics.addVertex(vertext: "H")
//graphics.addVertex(vertext: "I")
//
//graphics.addEdge(from: "A", to: "B")
//graphics.addEdge(from: "A", to: "F")
//graphics.addEdge(from: "B", to: "C")
//graphics.addEdge(from: "B", to: "I")
//graphics.addEdge(from: "B", to: "G")
//graphics.addEdge(from: "C", to: "I")
//graphics.addEdge(from: "C", to: "D")
//graphics.addEdge(from: "D", to: "I")
//graphics.addEdge(from: "D", to: "E")
//graphics.addEdge(from: "D", to: "G")
//graphics.addEdge(from: "D", to: "H")
//graphics.addEdge(from: "E", to: "F")
//graphics.addEdge(from: "E", to: "H")
//graphics.addEdge(from: "F", to: "G")
//graphics.addEdge(from: "G", to: "H")

////邻接矩阵，深度优先遍历算法
//var visited: [Bool] = []
//func DFS(graphics: Graph<String>, i: Int) {
//    visited[i] = true
//    print(graphics.vexs[i])
//
//    for j in 0..<graphics.vertexes {
//        if graphics.arc[i][j] == 1, !visited[j] {
//            DFS(graphics: graphics, i: j)
//        }
//    }
//}
//
//func DFSTraverse(graphics: Graph<String>) {
//    for _ in 0..<graphics.vertexes {
//        visited.append(false)
//    }
//
//    for i in 0..<graphics.vertexes {
//        if !visited[i] {
//            DFS(graphics: graphics, i: i)
//        }
//    }
//}
//
//DFSTraverse(graphics: graphics)

////邻接链表
//class EdgeNode<T: Equatable> {
//    var index: Int
//    var nextEdge: EdgeNode<T>?
//
//    init(atIndex index: Int) {
//        self.index = index
//    }
//}
//
//class VertexNode<T: Equatable> {
//    var data: T
//    var firstEdge: EdgeNode<T>?
//
//    init(_ data: T) {
//        self.data = data
//    }
//}
//
//class Graphics<T: Equatable> {
//    var adjList: [VertexNode<T>] = []
//    var numVertexes: Int {
//        return adjList.count
//    }
//    var numEdges: Int {
//        var count = 0
//        for vertex in adjList {
//            if let edge = vertex.firstEdge {
//                count += 1
//                var next = edge.nextEdge
//                while next != nil {
//                    count += 1
//                    next = next?.nextEdge
//                }
//            }
//        }
//        return count/2
//    }
//
//    func addVertex(vertex: T) {
//        let v = VertexNode<T>(vertex)
//        adjList.append(v)
//    }
//
//    func addEdge(from v1: T, to v2: T) {
//        let vertex1 = getVertex(data: v1)
//        let vertex2 = getVertex(data: v2)
//        guard vertex1 != nil, vertex2 != nil else {
//            return;
//        }
//
//        let index1 = getVertextIndex(v1)!
//        let index2 = getVertextIndex(v2)!
//
//        vertextAddEdge(vertex: vertex1!, index: index2)
//        vertextAddEdge(vertex: vertex2!, index: index1)
//    }
//
//    func vertextAddEdge(vertex: VertexNode<T>, index: Int) {
//        var edgeNode = vertex.firstEdge
//        guard edgeNode != nil else {
//            vertex.firstEdge = EdgeNode<T>(atIndex: index)
//            return;
//        }
//
//        let value = adjList[index].data
//        if adjList[(edgeNode?.index)!].data == value {
//            return
//        }
//        while edgeNode?.nextEdge != nil {
//            edgeNode = edgeNode?.nextEdge
//            if adjList[(edgeNode?.index)!].data == value {
//                return
//            }
//        }
//        edgeNode?.nextEdge = EdgeNode<T>(atIndex: index)
//    }
//
//    func getVertex(data: T) -> VertexNode<T>? {
//        for v in adjList {
//            if v.data == data {
//                return v
//            }
//        }
//        return nil
//    }
//
//    func getVertextIndex(_ data: T) -> Int? {
//        for index in 0..<adjList.endIndex {
//            let vertex = adjList[index]
//            if vertex.data == data {
//                return index
//            }
//        }
//        return nil
//    }
//}
//
//let graphics = Graphics<String>()
//graphics.addVertex(vertex: "A")
//graphics.addVertex(vertex: "B")
//graphics.addVertex(vertex: "C")
//graphics.addVertex(vertex: "D")
//graphics.addVertex(vertex: "E")
//graphics.addVertex(vertex: "F")
//graphics.addVertex(vertex: "G")
//graphics.addVertex(vertex: "H")
//graphics.addVertex(vertex: "I")
//
//graphics.addEdge(from: "A", to: "B")
//graphics.addEdge(from: "A", to: "F")
//graphics.addEdge(from: "B", to: "A")
//graphics.addEdge(from: "B", to: "C")
//graphics.addEdge(from: "B", to: "G")
//graphics.addEdge(from: "B", to: "I")
//graphics.addEdge(from: "C", to: "B")
//graphics.addEdge(from: "C", to: "D")
//graphics.addEdge(from: "C", to: "I")
//graphics.addEdge(from: "D", to: "C")
//graphics.addEdge(from: "D", to: "E")
//graphics.addEdge(from: "D", to: "G")
//graphics.addEdge(from: "D", to: "H")
//graphics.addEdge(from: "D", to: "I")
//graphics.addEdge(from: "E", to: "D")
//graphics.addEdge(from: "E", to: "F")
//graphics.addEdge(from: "E", to: "H")
//graphics.addEdge(from: "F", to: "G")
//graphics.addEdge(from: "G", to: "B")
//graphics.addEdge(from: "G", to: "D")
//graphics.addEdge(from: "G", to: "F")
//graphics.addEdge(from: "G", to: "H")

////邻接链表，深度优先遍历算法实现
//var visited: [Bool] = []
//func DFS(graphics: Graphics<String>, i: Int) {
//    visited[i] = true
//    print(graphics.adjList[i].data)
//
//    var edgeNode = graphics.adjList[i].firstEdge
//    while edgeNode != nil {
//        if !visited[(edgeNode?.index)!] {
//            DFS(graphics: graphics, i: (edgeNode?.index)!)
//        }
//        edgeNode = edgeNode?.nextEdge
//    }
//}
//
//func DFSTraverse(graphics: Graphics<String>) {
//    for _ in 0..<graphics.numVertexes {
//        visited.append(false)
//    }
//
//    for i in 0..<graphics.numVertexes {
//        if !visited[i] {
//            DFS(graphics: graphics, i: i)
//        }
//    }
//}
//
//DFSTraverse(graphics: graphics)


////邻接矩阵，广度优先遍历算法
//var visited: [Bool] = []
//
//func BFSTraverse(graphics: Graph<String>) {
//    for _ in 0..<graphics.vertexes {
//        visited.append(false)
//    }
//
//    var result: [String] = []
//    for i in 0..<graphics.vertexes {
//        if !visited[i] {
//            visited[i] = true
//            print(graphics.vexs[i])
//            result.append(graphics.vexs[i])
//            while !result.isEmpty {
//                result.removeFirst()
//                for j in 0..<graphics.vertexes {
//                    if graphics.arc[i][j] == 1, !visited[j] {
//                        visited[j] = true
//                        print(graphics.vexs[j])
//                        result.append(graphics.vexs[j])
//                    }
//                }
//            }
//        }
//    }
//}
//
//BFSTraverse(graphics: graphics)

////邻接链表，广度优先遍历算法实现
//var visited: [Bool] = []
//func BFSTraverse(graphics: Graphics<String>) {
//    for _ in 0..<graphics.numVertexes {
//        visited.append(false)
//    }
//
//    var result: [VertexNode<String>] = []
//    for i in 0..<graphics.numVertexes {
//        if !visited[i] {
//            visited[i] = true
//            print(graphics.adjList[i].data)
//            result.append(graphics.adjList[i])
//            while !result.isEmpty {
//                let vertex = result.removeFirst()
//                var edgeNode = vertex.firstEdge
//                while edgeNode != nil {
//                    if !visited[(edgeNode?.index)!] {
//                        visited[(edgeNode?.index)!] = true
//                        print(graphics.adjList[(edgeNode?.index)!].data)
//                        result.append(graphics.adjList[(edgeNode?.index)!])
//                    }
//                    edgeNode = edgeNode?.nextEdge
//                }
//            }
//        }
//    }
//}
//
//BFSTraverse(graphics: graphics)


////最小生成树
////邻接矩阵
public struct Graph<T: Equatable> {
    var vexs: [T] = []
    var arc: [[Int]] = []
    public var vertexes: Int {
        return vexs.count
    }
    public var edges: Int {
        var count = 0
        for items in arc {
            for item in items {
                if item > 0, item < Int.max {
                    count += 1
                }
            }
        }
        return count
    }

    public mutating func addVertex(vertext: T) {
        vexs.append(vertext)
        for i in 0..<arc.count {
            var temp = arc[i]
            temp.append(Int.max)
            arc[i] = temp
        }

        let newArray = Array(repeating: Int.max, count: arc.count+1)
        arc.append(newArray)
        for i in 0..<arc.count {
            arc[i][i] = 0
        }
    }

    public mutating func addEdge(from top1: T, to top2: T, weight: Int) {
        let containTop1 = vexs.contains { $0 == top1 }
        let containTop2 = vexs.contains { $0 == top2 }

        guard containTop1, containTop2 else {
            return
        }

        let row = vexs.index(of: top1)!
        let column = vexs.index(of: top2)!
        arc[row][column] = weight
        arc[column][row] = weight
    }
}

var graphics = Graph<String>()
graphics.addVertex(vertext: "v0")
graphics.addVertex(vertext: "v1")
graphics.addVertex(vertext: "v2")
graphics.addVertex(vertext: "v3")
graphics.addVertex(vertext: "v4")
graphics.addVertex(vertext: "v5")
graphics.addVertex(vertext: "v6")
graphics.addVertex(vertext: "v7")
graphics.addVertex(vertext: "v8")

//graphics.addEdge(from: "v0", to: "v1", weight: 10)
//graphics.addEdge(from: "v0", to: "v5", weight: 11)
//
//graphics.addEdge(from: "v1", to: "v2", weight: 18)
//graphics.addEdge(from: "v1", to: "v6", weight: 16)
//graphics.addEdge(from: "v1", to: "v8", weight: 12)
//
//graphics.addEdge(from: "v2", to: "v3", weight: 22)
//graphics.addEdge(from: "v2", to: "v8", weight: 8)
//
//graphics.addEdge(from: "v3", to: "v4", weight: 20)
//graphics.addEdge(from: "v3", to: "v6", weight: 24)
//graphics.addEdge(from: "v3", to: "v7", weight: 16)
//graphics.addEdge(from: "v3", to: "v8", weight: 21)
//
//graphics.addEdge(from: "v4", to: "v5", weight: 26)
//graphics.addEdge(from: "v4", to: "v7", weight: 7)
//
//graphics.addEdge(from: "v5", to: "v6", weight: 17)
//
//graphics.addEdge(from: "v6", to: "v7", weight: 19)

//最短路径
graphics.addEdge(from: "v0", to: "v1", weight: 1)
graphics.addEdge(from: "v0", to: "v2", weight: 5)

graphics.addEdge(from: "v1", to: "v0", weight: 1)
graphics.addEdge(from: "v1", to: "v2", weight: 3)
graphics.addEdge(from: "v1", to: "v3", weight: 7)
graphics.addEdge(from: "v1", to: "v4", weight: 5)

graphics.addEdge(from: "v2", to: "v0", weight: 5)
graphics.addEdge(from: "v2", to: "v1", weight: 3)
graphics.addEdge(from: "v2", to: "v4", weight: 1)
graphics.addEdge(from: "v2", to: "v5", weight: 7)

graphics.addEdge(from: "v3", to: "v1", weight: 7)
graphics.addEdge(from: "v3", to: "v4", weight: 2)
graphics.addEdge(from: "v3", to: "v6", weight: 3)

graphics.addEdge(from: "v4", to: "v1", weight: 5)
graphics.addEdge(from: "v4", to: "v2", weight: 1)
graphics.addEdge(from: "v4", to: "v3", weight: 2)
graphics.addEdge(from: "v4", to: "v5", weight: 3)
graphics.addEdge(from: "v4", to: "v6", weight: 6)
graphics.addEdge(from: "v4", to: "v7", weight: 9)

graphics.addEdge(from: "v5", to: "v2", weight: 7)
graphics.addEdge(from: "v5", to: "v4", weight: 3)
graphics.addEdge(from: "v5", to: "v7", weight: 5)

graphics.addEdge(from: "v6", to: "v3", weight: 3)
graphics.addEdge(from: "v6", to: "v4", weight: 6)
graphics.addEdge(from: "v6", to: "v7", weight: 2)
graphics.addEdge(from: "v6", to: "v8", weight: 7)

graphics.addEdge(from: "v7", to: "v4", weight: 9)
graphics.addEdge(from: "v7", to: "v5", weight: 5)
graphics.addEdge(from: "v7", to: "v6", weight: 2)
graphics.addEdge(from: "v7", to: "v8", weight: 4)

graphics.addEdge(from: "v8", to: "v6", weight: 7)
graphics.addEdge(from: "v8", to: "v7", weight: 4)

//for i in 0..<graphics.vertexes {
//    let result = graphics.arc[i].filter {$0 != Int.max}.filter{$0 != 0}
//    print(result)
//}

//func miniSpanTree_prim(graphics: Graph<String>) {
//    var adjvex = Array(repeating: 0, count: graphics.vertexes)  //初始化都为0，意味着从v0开始找
//    var lowcost = graphics.arc[0] //初始化为v0所关联的所有边的权值
//
//    //因为v0已经在adjvex里面了，所以从下标1开始寻找
//    var min: Int
//    for _ in 1..<graphics.vertexes {
//        min = Int.max  //lowcost下标为0则说明该顶点已被找过，下标为Int.max则意味着，没有该条边
//        var k = 0 //保存最小值的下标
//        for j in 1..<graphics.vertexes {
//            if lowcost[j] != 0, lowcost[j] < min {
//                min = lowcost[j]
//                k = j
//            }
//        }
//        print("\(adjvex[k], k)")  //adjvex[k]为当前的顶点，k为当前顶点关联权值最小边的顶点的下标
//        //将找到的最小权值边的下一个顶点加入adjvex，并且将该顶点相关联的较小边加入lowcost
//        for j in 1..<graphics.vertexes {
//            if lowcost[j] != 0, graphics.arc[k][j] < lowcost[j] {
//                lowcost[j] = graphics.arc[k][j]
//                adjvex[j] = k
//            }
//        }
//    }
//}
//
//miniSpanTree_prim(graphics: graphics)

//struct Edge{
//    let begin: Int, end: Int, weight: Int
//    init (begin: Int, end: Int, weight: Int) {
//        self.begin = begin
//        self.end = end
//        self.weight = weight
//    }
//}
//
//func miniSpanTree_Kruskal(graphics: Graph<String>) {
//    var edges: [Edge] = []  //边集数组
//    for i in 1..<graphics.vertexes {
//        let arc = graphics.arc[i-1]
//        for j in i..<graphics.vertexes {
//            if arc[j] < Int.max {
//                let edge = Edge(begin: i-1, end: j, weight: arc[j])
//                edges.append(edge)
//            }
//        }
//    }
//    edges.sort{$0.weight < $1.weight}
//    var parent = Array(repeating: 0, count: graphics.vertexes)  //判断是否成环的数组
//    for i in 0..<edges.count {
//        let n = find(parent: parent, fedge: edges[i].begin)
//        let m = find(parent: parent, fedge: edges[i].end)
//        if n != m {  //一条边从两边开始计算，只要最后的点相等，则会构成环
//            parent[n] = m
//            print("\(edges[i].begin, edges[i].end) \(edges[i].weight)")
//        }
//    }
//}
//
////寻找每个点的路径
//func find(parent: [Int], fedge: Int) -> Int {
//    var result = fedge
//    while parent[result] > 0 {
//        result = parent[result]
//    }
//    return result
//}
//
//miniSpanTree_Kruskal(graphics: graphics)

////迪杰特斯拉算法
//func shortestPath_Dijkstra(graphics: Graph<String>) {
//    var final = Array(repeating: 0, count: graphics.vertexes)  //final[N]=1，表示求的顶点v0至vN的最短路径
//    var pathArc = Array(repeating: 0, count: graphics.vertexes)  //储存最短路径下标前驱的数组
//    var shortPathTable: [Int] = []  //表示v0到各个顶点的最短路径长度
//    for i in 0..<graphics.vertexes {
//        shortPathTable.append(graphics.arc[0][i])
//    }
//    final[0] = 1  //v0-v0不需要求路径
//    //开始求v0到各个顶点的最短路径
//    for _ in 1..<graphics.vertexes {
//        var min = Int.max  //当前所知离v0顶点最近的距离
//        var k = 0
//        for w in 0..<graphics.vertexes {
//            if final[w] == 0, shortPathTable[w] < min {
//                k = w
//                min = shortPathTable[w]
//            }
//        }
//        final[k] = 1
//        for w in 0..<graphics.vertexes {
//            if final[w] == 0, min < shortPathTable[w]-graphics.arc[k][w]{
//                shortPathTable[w] = min + graphics.arc[k][w]
//                pathArc[w] = k
//            }
//        }
//    }
//
//    print(final)
//    print(pathArc)
//    print(shortPathTable)
//}
//
//shortestPath_Dijkstra(graphics: graphics)

//佛洛伊德算法
func ShortestPath_Floyd(graphics: Graph<String>) {
    //初始化矩阵
    var pathmatirx: [[Int]]
    var shortPathTable: [[Int]] = graphics.arc
    
    var rowValue: [Int] = []
    for i in 0..<graphics.vertexes {
        rowValue.append(i)
    }
    pathmatirx = Array(repeating: rowValue, count: graphics.vertexes)
    
    //开始算法
    for k in 0..<graphics.vertexes {
        for v in 0..<graphics.vertexes {
            for w in 0..<graphics.vertexes {
                if shortPathTable[v][k] < Int.max, shortPathTable[k][w] < Int.max, shortPathTable[v][w] > shortPathTable[v][k] + shortPathTable[k][w] {
                    shortPathTable[v][w] = shortPathTable[v][k] + shortPathTable[k][w]
                    pathmatirx[v][w] = pathmatirx[v][k]
                }
            }
        }
    }
    
    for item in pathmatirx {
        print(item)
    }
//    //打印最短路径
//    var k = 0
//    for v in 0..<graphics.vertexes {
//        for w in v+1..<graphics.vertexes {
//            print("v\(v)-v\(w) weight: \(shortPathTable[v][w])")
//            k = pathmatirx[v][w]
//            print("path: \(v)")
//            while k != w {
//                print(" -> \(k)")
//                k = pathmatirx[k][w]
//            }
//            print(" -> \(w)")
//        }
//        print("\n")
//    }
}

ShortestPath_Floyd(graphics: graphics)
