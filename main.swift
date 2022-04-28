import Darwin
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
    print(length,N)
    
    if length == 1 && n == 1 {
        return nil
    }
    
    while currentNode != nil {
        if currentIndex == N {
            if sz == nil {
                sz = currentNode
                break
            }
            sz?.next = currentNode?.next
            break
        }
        if sz == nil {
            sz = currentNode
        }else {
            sz?.next = currentNode
        }
        currentNode = currentNode!.next
        currentIndex += 1
    }
    
    return sz
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

for i in 2...5 {
    var node:ListNode? = head
    while node?.next != nil {
        node = node!.next!
        print(i,node?.val)
    }
    node?.next = ListNode(i)
    head = node
}

var remove = removeNthFromEnd(head, 2)

while remove != nil {
    print(remove?.val)
    remove = remove?.next
}


