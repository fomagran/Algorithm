func swapPairs(_ head: ListNode?) -> ListNode? {
       if head?.next == nil { return head }
       var current:ListNode? = ListNode(head!.next!.val,ListNode(head!.val))
       var root:ListNode? = current
       var array:[Int] = []
       var h:ListNode? = head
   

       while h != nil {
           array.append(h!.val)
           h = h?.next
       }
     
       var x = 3
       
       current = current?.next
       
       while x < array.count {
           current?.next = ListNode(array[x],ListNode(array[x-1]))
           current = current?.next?.next
           x += 2
       }
       
       if array.count%2 == 1 {
           current?.next = ListNode(array[array.count-1])
       }
       
       return root
   }
