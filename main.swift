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

func serialize(_ root: TreeNode?) -> String {
    var serializedString = ""
    var queue = [LevelNode(level: 1,node: root)]
    var currentLevel = 0
    
    while !queue.isEmpty {
        let first = queue.removeFirst()
        
        if first.level > currentLevel {
            currentLevel += 1
            serializedString += ",\(first.node?.val ?? -1001)"
        } else {
            serializedString += " \(first.node?.val ?? -1001)"
        }
        
        if first.node == nil {
            continue
        }
        
        queue.append(LevelNode(level: first.level + 1, node: first.node?.left))
        queue.append(LevelNode(level: first.level + 1, node: first.node?.right))
    }
    
    print(serializedString)
    
    return serializedString
}

func deserialize(_ data: String) -> TreeNode? {
    let levelSplit = data.split(separator: ",")
    var levelNodes = [[TreeNode?]]()
    var root: TreeNode? = nil
    
    for level in levelSplit {
        levelNodes.append(level.split(separator: " ").map{$0 == "-1001"
            ? nil : TreeNode(Int($0)!)})
    }

    for (i,nodes) in levelNodes.enumerated() {
        if i == 0 {
            root = levelNodes[i][0]
            continue
        }
        
        for (j,node) in nodes.enumerated() {
            if let node = node {
                let levelNodes = levelNodes[i-1].filter{$0 != nil}
                let parent = j == 0 ? levelNodes[0] : levelNodes[j/2]
                
                if j%2 == 0 {
                    parent?.left = node
                } else {
                    parent?.right = node
                }
            }
        }
    }
    
    return root
}

let tree:TreeNode? = TreeNode(1)
tree?.left = TreeNode(2)
tree?.right = TreeNode(3)
tree?.right?.left = TreeNode(4)
tree?.right?.right = TreeNode(5)
tree?.right?.left?.left = TreeNode(6)
tree?.right?.left?.right = TreeNode(7)

let string = serialize(tree)

let t = deserialize(string)

func d(_ node: TreeNode?) {
    
    print(node?.val)
    
    if node == nil {
        return
    }
    
    d(node?.left)
    d(node?.right)
}

d(t)
