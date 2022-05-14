public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var answer:ListNode? = nil
    var current:ListNode? = nil
    var first:ListNode? = nil
    var last:ListNode? = nil
    
    for list in lists {
        if answer == nil {
            appendAll(list)
            continue
        }else {
            
        }
    }
    
    func appendAll(_ l:ListNode?) {
        var current = l
        while current != nil {
            if let _ = answer {
                answer?.next = ListNode(current!.val)
                answer = answer?.next
            }else {
                answer = current
            }
            current = current?.next
        }
    }
    
    return answer
}


