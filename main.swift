func maxDepth(_ root: TreeNode?) -> Int {
    var answer:Int = -1
    
    func dfs(_ node: TreeNode?,_ depth: Int) {
        if node == nil {
            answer = max(answer,depth)
            return
        }
        dfs(node?.left,depth+1)
        dfs(node?.right,depth+1)
    }
    
    dfs(root,0)
    return answer
}
