func swapPairs(_ head: ListNode?) -> ListNode? {
        if head?.next == nil { return head }
        var current:ListNode? = ListNode(head!.next!.val,ListNode(head!.val))
        var root:ListNode? = current
        var hPast:ListNode? = head?.next?.next
        var h:ListNode? = head?.next?.next?.next
    
        current = current?.next

        while h != nil {
            current?.next = ListNode(h!.val,ListNode(hPast!.val))
            hPast = hPast?.next?.next
            h = h?.next?.next
            current = current?.next?.next
        }
        
        if hPast != nil {
            current?.next = ListNode(hPast!.val)
        }
        
        return root
    }
