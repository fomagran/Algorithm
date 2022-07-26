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

func isValidBST(_ root: TreeNode?) -> Bool {
    
    var isValid: Bool = true
    
    func check(node: TreeNode?,minValue: Int, maxValue:Int) {
        if node == nil || !isValid {
            return
        }
        
        if (node!.left?.val ?? Int.min) >= node!.val || (node!.right?.val ?? Int.max) <= node!.val {
            isValid = false
            return
        }
        
        if minValue >= node!.val || node!.val >= maxValue  {
            isValid = false
            return
        }
        
        check(node: node?.left, minValue: minValue, maxValue: min(maxValue,node!.val))
        check(node: node?.right, minValue: max(minValue,node!.val), maxValue: maxValue)
    
    }
    
    check(node: root, minValue: Int.min, maxValue: Int.max)

    return isValid
}

let root:TreeNode = TreeNode(120)
root.left = TreeNode(70)
root.right = TreeNode(140)
root.left?.left = TreeNode(50)
root.left?.right = TreeNode(100)
root.right?.left = TreeNode(130)
root.right?.right = TreeNode(160)
root.left?.left?.left = TreeNode(20)
root.left?.left?.right = TreeNode(55)
root.left?.left?.left?.left = TreeNode(75)
root.left?.left?.left?.right = TreeNode(110)
root.left?.left?.right?.left = TreeNode(119)
root.left?.left?.right?.right = TreeNode(135)

print(isValidBST(root))



/*
                    120
            70              140
        50    100      130     160
       20 55 75 110  119 135  150 200
 */


