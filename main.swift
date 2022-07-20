
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

func largestValues(_ root: TreeNode?) -> [Int] {
    var maxNodes = [Int]()
    
        func dfs(_ node: TreeNode?,_ level:Int) {
            if node == nil {
                return
            }
            
            if maxNodes.count == level {
                maxNodes.append(node!.val)
            } else {
                maxNodes[level] = max(maxNodes[level],node?.val ?? Int.min)
            }

            dfs(node?.left,level+1)
            dfs(node?.right,level+1)
        }
    
    dfs(root,0)
    
    return maxNodes
}

let root:TreeNode? = TreeNode(1)
root?.left = TreeNode(2)
root?.right = TreeNode(3)


print(largestValues(root))
