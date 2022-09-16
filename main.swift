func hasCycle(_ head: ListNode?) -> Bool {
    if head == nil {
        return false
    }
    
    if head!.val == Int.max {
        return true
    }
    
    head!.val = Int.max
    return hasCycle(head!.next)
}
