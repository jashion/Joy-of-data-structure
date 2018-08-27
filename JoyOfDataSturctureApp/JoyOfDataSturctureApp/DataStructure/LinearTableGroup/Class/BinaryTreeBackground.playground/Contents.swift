//: Playground - noun: a place where people can play

import UIKit

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
    }
}


class BinaryTree {
    private var head: TreeNode?
    var bTreeHead: TreeNode? {
        return head
    }
    func createBinaryTree() {
        var nodes: [TreeNode] = []
        
        for i in 0..<12 {
            nodes.append(TreeNode(i))
        }
        
        head = nodes[1]
        head?.left = nodes[2]
        head?.right = nodes[7]
        
        nodes[2].left = nodes[3]
        nodes[2].right = nodes[5]
        
        nodes[7].left = nodes[8]
        nodes[7].right = nodes[9]
        
        nodes[3].right = nodes[4]
        
        nodes[5].left = nodes[6]
        
        nodes[9].left = nodes[10]
        nodes[9].right = nodes[11]
    }
    
    //反转二叉树：递归
    func binaryTreeMirror(root: TreeNode?) {
        guard root != nil else {
            return
        }
        let temp = root?.left
        root?.left = root?.right
        root?.right = temp
        binaryTreeMirror(root: root?.left)
        binaryTreeMirror(root: root?.right)
    }
    
    //反转二叉树：非递归（和递归的思想一样）
    func binaryTreeMirror2(root: TreeNode?) {
        guard root != nil else {
            return
        }
        
        var stack: [TreeNode] = []
        stack.append(root!)
        while stack.count > 0 {
            let treeNode = stack.removeFirst()
            let temp = treeNode.left
            treeNode.left = treeNode.right
            treeNode.right = temp
            if let leftNode = treeNode.left {
                stack.append(leftNode)
            }
            if let rightNode = treeNode.right {
                stack.append(rightNode)
            }
        }
    }
    
    func InTraverse(root: TreeNode?) {
        guard root != nil else {
            return
        }
        
        InTraverse(root: root?.left)
        print("\((root?.val)!)")
        InTraverse(root: root?.right)
    }
}

let bTree = BinaryTree()
bTree.createBinaryTree()
//bTree.binaryTreeMirror(root: bTree.bTreeHead)
bTree.binaryTreeMirror2(root: bTree.bTreeHead)
bTree.InTraverse(root: bTree.bTreeHead)
