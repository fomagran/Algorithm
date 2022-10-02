public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func isBalanced(_ root: TreeNode?) -> Bool {
    var isBalanced = true
    
    func dfs(_ node: TreeNode?) -> Int {
        if node == nil || !isBalanced {
            return 0
        }
        
        let left = dfs(node?.left)
        let right = dfs(node?.right)
        
        if abs(left-right) > 1 {
            isBalanced = false
            return 0
        }
        
        return max(left,right) + 1
    }
    
    return dfs(root) != -1
}

let root:TreeNode? = TreeNode(0)
root?.left = TreeNode(1)
root?.right = TreeNode(2)
root?.left?.left = TreeNode(3)
root?.left?.right = TreeNode(4)
root?.right?.left = TreeNode(5)
root?.right?.right = TreeNode(6)
root?.left?.left?.left = TreeNode(7)
root?.left?.left?.right = TreeNode(8)
root?.left?.right?.left = TreeNode(9)
root?.left?.right?.right = TreeNode(10)
root?.right?.left?.left = TreeNode(11)
root?.right?.left?.right = TreeNode(12)
root?.right?.right?.left = TreeNode(13)
root?.right?.right?.right = TreeNode(14)
root?.left?.left?.left?.left = TreeNode(15)
root?.left?.left?.left?.right = TreeNode(16)

//                0
//        1              2
//    3       4       5     6
//   7  8    9  10  11 12 13 14
// 15 16

isBalanced(root)

