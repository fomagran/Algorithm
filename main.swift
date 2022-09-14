public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func reorderList(_ head: ListNode?) {
    var node: ListNode? = head
    var normalNode: ListNode? = ListNode(head!.val)
    var normalRoot = normalNode
    var reversedNode: ListNode? = ListNode(head!.val)
    var count = 0
    var root = head
    
    while node != nil {
        count += 1
        normalNode?.next = node?.next
        normalNode = normalNode?.next
        let new: ListNode? = ListNode(node!.val)
        new?.next = reversedNode
        reversedNode = new
        node = node?.next
    }
    
    for i in 1...count {
        if i == 1 {
            normalRoot = normalRoot?.next
            continue
        }
        
        if i%2 == 1 {
            root?.next = normalRoot
            normalRoot = normalRoot?.next
        } else {
            root?.next = reversedNode
            reversedNode = reversedNode?.next
        }
        
        root = root?.next
    }
    
    root?.next = nil
}

let head: ListNode? = ListNode(1)
head?.next = ListNode(2)
//head?.next?.next = ListNode(3)
//head?.next?.next?.next = ListNode(4)
//head?.next?.next?.next?.next = ListNode(5)
//head?.next?.next?.next?.next?.next = ListNode(6)

reorderList(head)


