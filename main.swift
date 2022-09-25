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

func invertTree(_ root: TreeNode?) -> TreeNode? {
    func dfs(_ node: TreeNode?) {
        if node?.left == nil {
            return
        }
        
        
        node?.left = node?.right
        node?.right = node?.left
        
        dfs(node?.left)
        dfs(node?.right)
    }
    dfs(root)
    
    
    return root
}
