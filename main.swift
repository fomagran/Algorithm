
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


func inorderTraversal(_ root: TreeNode?) -> [Int] {
    
}

let test:[Int?] = [1,2,nil,3,4,nil,5,6]
let r = TreeNode(0)

var current = 0

while current < test.count {
    
}
