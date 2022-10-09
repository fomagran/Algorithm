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
    var array = [Int]()
    
    func dfs(_ node: TreeNode?) {
        if node == nil {
            return
        }
        
        if array.isEmpty {
            array.append(node!.val)
            dfs(node?.left)
            dfs(node?.right)
            return
        }
        
        var left = 0
        var right = array.count - 1
        
        while left < right {
            let mid = (left+right)/2
            
            if array[mid] < node!.val {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        if array[left] < node!.val {
            array.insert(node!.val, at: left)
        } else {
            if left + 1  >= array.count - 1 {
                array.append(node!.val)
            } else {
                array.insert(node!.val, at: left + 1)
            }
        }
    
        dfs(node?.left)
        dfs(node?.right)
    }

    dfs(root)
    
    return array[array.count - k]
}

let root = TreeNode(3)
//root.left = TreeNode(1)
//root.right = TreeNode(4)
//root.left?.left = TreeNode(2)
//root.left?.right = TreeNode(2)
//root.right?.left = TreeNode(3)
//root.right?.right = TreeNode(6)
//root.left?.left?.left = TreeNode(1)

print(kthSmallest(root, 1))



