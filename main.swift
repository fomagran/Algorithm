
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


var answer:[Int] = []

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    searchByInOrder(root)
    return answer
}

func searchByInOrder(_ node:TreeNode?) {
    if node != nil {
        if node?.left != nil {
            searchByInOrder(node?.left)
        }
        answer.append(node!.val)
        if node?.right != nil {
            searchByInOrder(node?.right)
        }
    }
}
