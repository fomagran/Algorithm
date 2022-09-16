public class Node:Hashable {
    public var val: Int
    public var next: Node?
    public var random: Node?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
        self.random = nil
    }
}

func copyRandomList(_ head: Node?) -> Node? {
    var node = head
    var copiedDic =  [Node: Node]()
    
    while node != nil {
        copiedDic[node!] = Node(node!.val)
        node = node!.next
    }
    
    node = head
    
    while node != nil {
        let copiedNode = copiedDic[node!]
        if let next = node!.next {
            copiedNode?.next = copiedDic[next]
        }
        if let random = node!.random {
            copiedNode?.random = copiedDic[random]
        }
        node = node!.next
    }
    
    return copiedDic[head!]
}
