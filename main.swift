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

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    func dfs(_ pNode: TreeNode?, _ qNode: TreeNode?) -> Bool {
        if pNode == nil && qNode == nil {
            return true
        }
        
        if pNode?.val != qNode?.val {
            return dfs(pNode?.left,qNode?.left) &&    dfs(pNode?.right,qNode?.right)
        }
        
        return false
    }
    
    return  dfs(p, q)
}

let p:TreeNode? = TreeNode(10)
p?.left = TreeNode(5)
p?.right = TreeNode(15)
//p?.left?.left = TreeNode(3)
//p?.left?.right = TreeNode(4)
//p?.right?.left = TreeNode(5)
//p?.right?.right = TreeNode(6)

let q:TreeNode? = TreeNode(10)
q?.left = TreeNode(5)
//q?.right = TreeNode()
//q?.left?.left = TreeNode(3)
q?.left?.right = TreeNode(15)
//q?.right?.left = TreeNode(5)
//q?.right?.right = TreeNode(6)

print(isSameTree(p, q))
