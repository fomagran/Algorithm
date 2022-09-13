func reverseList(_ head: ListNode?) -> ListNode? {
    func reverseNode(_ node: ListNode?, _ tailNode:ListNode?) -> ListNode? {
        let newTail = ListNode(node?.val ?? 0)
        newTail.next = tailNode
        return node == nil ? tailNode : reverseNode(node?.next,newTail)
    }
    return reverseNode(head,nil)
}
