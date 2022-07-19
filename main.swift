public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func oddEvenList(_ head: ListNode?) -> ListNode? {
        var index: Int = 0
        var current: ListNode? = head
        var oddTail: ListNode? = nil
        var oddRoot: ListNode? = nil
        var evenTail: ListNode? = nil
        var evenRoot: ListNode? = nil

        
        while current != nil {
            if index % 2 == 0 {
                if oddTail == nil {
                    oddTail = ListNode(current!.val)
                    oddRoot = oddTail
                }else {
                    oddTail?.next = ListNode(current!.val)
                    oddTail = oddTail?.next
                }
            }else {
                 if evenTail == nil {
                    evenTail = ListNode(current!.val)
                    evenRoot = evenTail
                }else {
                    evenTail?.next = ListNode(current!.val)
                    evenTail = evenTail?.next
                }
            }
            index += 1
            current = current?.next
        }
        
        oddTail?.next = evenRoot
        
        return oddRoot
    }

