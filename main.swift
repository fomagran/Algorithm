public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    let total:Int = countNode(head)
    var count:Int = 0
    var node:ListNode? = nil
    var start:ListNode? = head
    var root:ListNode? = nil
    
    func recursion(_ count:Int,_ n:ListNode?) {
        if count == k { return }
        start = n?.next
        recursion(count+1,n?.next)

        if node == nil {
            node = n
            root = node
        }else {
            node?.next = ListNode(n!.val)
            node = node?.next
        }
    }
    
    while count + k <= total {
        recursion(0, start)
        count += k
    }
    
    node?.next = start
    
    return root
}

func countNode(_ head:ListNode?) -> Int {
    var count:Int = 0
    var node:ListNode? = head
    
    while node != nil {
        count += 1
        node = node?.next
    }
    return count
}

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
//head.next?.next?.next = ListNode(4)
//head.next?.next?.next?.next = ListNode(5)
//head.next?.next?.next?.next?.next = ListNode(6)
//head.next?.next?.next?.next?.next?.next = ListNode(7)

var n:ListNode? = reverseKGroup(head, 2)

while n != nil {
    print(n!.val)
    n = n?.next
}
