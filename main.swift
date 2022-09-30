func isBalanced(_ root: TreeNode?) -> Bool {
    var isBalanced = true
    
    func dfs(_ node: TreeNode?) -> Int {
        if node == nil {
            return 0
        }
        
        let left = dfs(node?.left)
        let right = dfs(node?.right)
        
        if !isBalanced || abs(left-right) > 1 {
            isBalanced = false
            return 0
        }
        
        return max(left,right) + 1
    }
    
    dfs(root)
    
    return isBalanced
}
