public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var isOver10 = 0
    var sum = getSum(v1: l1!.val, v2: l2!.val, isOver10: &isOver10)
    var root:ListNode = ListNode(sum)
    let answerList = root
    var l1:ListNode? = l1?.next
    var l2:ListNode? = l2?.next
    
    while l1 != nil || l2 != nil {
        sum = getSum(v1: l1?.val ?? 0, v2: l2?.val ?? 0, isOver10: &isOver10)
        l1 = l1?.next
        l2 = l2?.next
        root.next = ListNode(sum)
        root = root.next!
    }
    if isOver10 == 1 {
        root.next = ListNode(1)
    }
    return answerList
}

func getSum(v1:Int,v2:Int,isOver10:inout Int) -> Int {
    var sum = (v1+v2+isOver10)
    isOver10 = sum >= 10 ? 1 : 0
    sum = sum >= 10 ? sum-10 : sum
    return sum
}

var l1:ListNode? = ListNode(9)
l1?.next = ListNode(9)
l1?.next?.next = ListNode(9)
l1?.next?.next?.next = ListNode(9)
l1?.next?.next?.next?.next = ListNode(9)
l1?.next?.next?.next?.next?.next = ListNode(9)
l1?.next?.next?.next?.next?.next?.next = ListNode(9)

var l2:ListNode? = ListNode(9)
l2?.next = ListNode(9)
l2?.next?.next = ListNode(9)
l2?.next?.next?.next = ListNode(9)

var root = addTwoNumbers(l1, l2)
while root != nil {
    print(root?.val)
    root = root?.next
}
    
    
