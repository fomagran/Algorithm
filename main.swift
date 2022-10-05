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

struct LevelNode {
    let level: Int
    let node: TreeNode?
}

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var queue = [LevelNode(level:1,node:root)]
    var answer = [[Int]]()
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        if first.node == nil {
            continue
        }
        if answer.count < first.level {
            answer.append([first.node!.val])
        } else {
            answer[first.level-1].append(first.node!.val)
        }
        
        queue.append(LevelNode(level: first.level + 1, node: first.node?.left))
        queue.append(LevelNode(level: first.level + 1, node: first.node?.right))
    }
    
    return answer
}


