func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var array:[Int] = []
    
    for list in lists {
        var node = list
        while node != nil {
            array.append(node!.val)
            node = node?.next
        }
    }
    
    var node:ListNode? = nil
    var root:ListNode? = nil
    
    for n in array.sorted() {
        if node == nil {
            node = ListNode(n)
            root = node
        }else {
            node?.next = ListNode(n)
            node = node?.next
        }
    }
    
    return root
}

