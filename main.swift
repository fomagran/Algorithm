public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var currentIndex:Int = 1
    var currentNode:ListNode? = head
    var sz:ListNode? = nil
    let length:Int = countNodeList(head)
    let N:Int = length - (n-1)
    
    if N == 1 {
        return head?.next
    }
    
    while currentNode != nil {
        if currentIndex == N {
            append(currentNode?.next, &sz)
            break
        }
        if sz == nil {
            sz = ListNode(head!.val,nil)
        }else {
            append(ListNode(currentNode!.val,nil), &sz)
        }
        currentNode = currentNode!.next
        currentIndex += 1
    }
    
    return sz
}

func append(_ add:ListNode?,_ root:inout ListNode?) {
    var node:ListNode? = root
    while node?.next != nil {
        node = node?.next!
    }
    node?.next = add
}


func countNodeList(_ head:ListNode?) -> Int {
    var count:Int = 0
    var current:ListNode? = head
    while current != nil {
        current = current!.next
        count += 1
    }
    return count
}


var head:ListNode? = ListNode(1)
append(ListNode(2),&head)
//append(ListNode(3),&head)
//append(ListNode(4),&head)
//append(ListNode(5),&head)



var remove = removeNthFromEnd(head, 2)


