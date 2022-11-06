func isSymmetric(_ root: TreeNode?) -> Bool {
    var leftValues = [Int?]()
    var rightValues = [Int?]()
    dfs(root?.left,&leftValues,true)
    dfs(root?.right,&rightValues,false)
    
    return leftValues == rightValues
}

func dfs(_ node: TreeNode?,_ values: inout [Int?],_ isLeft: Bool) {
    values.append(node?.val)
    if let node = node {
        if isLeft {
            dfs(node.left,&values,isLeft)
            dfs(node.right,&values,isLeft)
        } else {
            dfs(node.right,&values,isLeft)
            dfs(node.left,&values,isLeft)
        }
    }
}
