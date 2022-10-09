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

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    var array = [root!.val]
    
    func dfs(_ node: TreeNode?, _ parentIndex: Int, _ isLeft: Bool) {
        if node == nil {
            return
        }
        
        if isLeft {
            array.insert(node!.val,at: parentIndex)
            dfs(node?.left,parentIndex,true)
            dfs(node?.right,parentIndex,false)
        } else {
            if parentIndex == array.count - 1 {
                array.append(node!.val)
            } else {
                array.insert(node!.val,at: parentIndex+1)
            }
            
            dfs(node?.left,parentIndex + 1,true)
            dfs(node?.right,parentIndex + 1,false)
        }
    }
    

    
    dfs(root?.left,0,true)
    dfs(root?.right,0,false)
    
    print(array)
    
    return array[k-1]
}

let root = TreeNode(5)
root.left = TreeNode(3)
root.right = TreeNode(6)
root.left?.left = TreeNode(2)
root.left?.right = TreeNode(4)
//root.right?.left = TreeNode(3)
//root.right?.right = TreeNode(6)
root.left?.left?.left = TreeNode(1)

print(kthSmallest(root, 3))



