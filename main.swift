func copyRandomList(_ head: Node?) -> Node? {
    var node = head
    var root = Node(-1)
    var copiedNode = root
    
    while node != nil {
        let newNode = Node(node!.val)
        newNode.next = node?.next
        node?.next = newNode
        node = newNode.next
    }
    
    node = head
    
    while node != nil {
        let newNode = node?.next
        newNode?.random = node?.random?.next
        node = newNode?.next
    }
    
    node = head
    
    while node != nil {
        let newNode = node?.next
        copiedNode.next = newNode
        copiedNode = copiedNode.next!
        node?.next = newNode?.next
        node = node?.next
    }
    
    return root.next
}
