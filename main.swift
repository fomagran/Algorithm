public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    var l1:ListNode? = list1
    var l2:ListNode? = list2
    var answer:ListNode? = nil
    
    if list1 == nil || list2 == nil {
        return list1 == nil ? list2 : list1
    }
    
    while l1 != nil || l2 != nil {
        if l1 == nil {
            append(l2)
            return answer
        }
        
        if l2 == nil {
            append(l1)
            return answer
        }
        
        if l1!.val < l2!.val {
            if answer == nil {
                answer = ListNode(l1!.val)
            }else {
                append(ListNode(l1!.val))
            }
            l1 = l1?.next
        }else {
            if answer == nil {
                answer = ListNode(l2!.val)
            }else {
            append(ListNode(l2!.val))
            }
            l2 = l2?.next
        }
    }
    
    func append(_ add:ListNode?) {
           var node:ListNode? = answer
           while node?.next != nil {
               node = node?.next!
           }
           node?.next = add
       }
    
    return answer
}


