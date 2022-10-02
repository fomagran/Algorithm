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
    var pVal = [Int]()
    var qVal = [Int]()
    
    func dfs(_ node: TreeNode?,_ isP: Bool, _ n: Int) {
        if isP {
            pVal.append(node?.val ?? Int.min)
        } else {
            qVal.append(node?.val ?? Int.min)
        }

        if node == nil {
            return
        }
        
        dfs(node?.left,isP,n+1)
        dfs(node?.right,isP,n+1)
    }
    
    dfs(p, true,0)
    dfs(q,false,0)
    
    for i in 0..<pVal.count {
        if pVal[i] != qVal[i] {
            return false
        }
    }
    
    return true
}

let p:TreeNode? = TreeNode(0)
p?.left = TreeNode(1)
p?.right = TreeNode(2)
p?.left?.left = TreeNode(3)
p?.left?.right = TreeNode(4)
p?.right?.left = TreeNode(5)
p?.right?.right = TreeNode(6)

let q:TreeNode? = TreeNode(0)
q?.left = TreeNode(1)
q?.right = TreeNode(2)
q?.left?.left = TreeNode(3)
q?.left?.right = TreeNode(4)
q?.right?.left = TreeNode(5)
q?.right?.right = TreeNode(6)

print(isSameTree(p, q))
