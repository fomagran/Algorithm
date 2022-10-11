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

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    let root = TreeNode(preorder[0])
    var tempRoot: TreeNode? = root
    var node: TreeNode? = tempRoot
    var pre = 1
    var ino = 0

    func addLeftChild() {
        if inorder[ino] == preorder[pre-1] {
            return
        }
    
        node!.left = TreeNode(preorder[pre])
        node = node!.left
        pre += 1
        addLeftChild()
    }

    func addRightChild() {
        tempRoot?.right = TreeNode(preorder[pre])
        findEnd()
        tempRoot = tempRoot?.right
        node = tempRoot
        pre += 1
    }

    func findEnd() {
        if inorder[ino] == tempRoot!.val {
            ino += 1
            return
        }
        ino += 1
        findEnd()
    }
    
    while true {
        if pre > preorder.count - 1 {
            break
        }
        addLeftChild()
        if pre > preorder.count - 1 {
            break
        }
        addRightChild()
    }
    
    return root
}

let tree = buildTree([1,2,3], [2,3,1])

func dfs(_ node: TreeNode?) {
    print(node?.val)
    if node == nil {
        return
    }
    dfs(node?.left)
    dfs(node?.right)
}

dfs(tree)

