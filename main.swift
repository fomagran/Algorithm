func reverseList(_ head: ListNode?) -> ListNode? {
    func reverseNode(_ nextNode: ListNode?, _ tailNode:ListNode?) -> ListNode? {
        if let node = nextNode {
            var newNode = ListNode(node.val)
            newNode.next = tailNode
            return reverseNode(node.next,newNode)
        }
        return tailNode
    }
    return reverseNode(head,nil)
}
