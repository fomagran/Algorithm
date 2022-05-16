public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class LinkedList {
    var root:ListNode?
    var tail:ListNode?
    
    init(_ root:ListNode?) {
        self.root = root
        var current = root
        while current?.next != nil {
            current = current?.next
        }
        self.tail = current
    }
    
    func insert(_ node:ListNode) {
        var current = root
        
        if current == nil {
            append(node)
            return
        }
        
        if current!.val > node.val {
            let past = root
            root = ListNode(node.val,past)
            return
        }
        
        while current?.next != nil{
            if current!.next!.val > node.val {
                break
            }
            current = current?.next
        }
        
        if current?.next != nil {
            let next = current?.next
            current?.next = ListNode(node.val, next)
        }else {
            append(node)
        }
    }
    
    func append(_ node:ListNode?) {
        if tail == nil {
            root = node
            tail = node
            return
        }
        tail?.next = node
        tail = tail?.next
    }
}

class Solution {
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        if lists.isEmpty { return nil }
        
        var answer:LinkedList = LinkedList(lists[0])

        for (i,list) in lists.enumerated() {
            if list == nil { continue }
            if i == 0 { continue }
            
            var current:ListNode? = list
            
            if answer.root == nil {
                answer = LinkedList(list)
                continue
            }
            
            while current != nil {
                if answer.tail?.val ?? Int.min <= current!.val {
                    answer.append(current)
                    current = current?.next
                    continue
                }
                answer.insert(current!)
                current = current?.next
            }
        }

        return answer.root
    }
}

var list1:LinkedList = LinkedList(nil)
list1.append(ListNode(-1))
list1.append(ListNode(1))

var list2:LinkedList = LinkedList(nil)
list2.append(ListNode(-3))
list2.append(ListNode(1))
list2.append(ListNode(4))

var list3:LinkedList = LinkedList(nil)
list3.append(ListNode(-2))
list3.append(ListNode(-1))
list3.append(ListNode(0))
list3.append(ListNode(2))


//var list3:LinkedList = LinkedList(nil)
//list3.append(ListNode(2))
//list3.append(ListNode(6))



let answer = Solution().mergeKLists([list1.root,list2.root,list3.root])

var current = answer
print("-----------")
while current != nil {
    print(current?.val)
    current = current?.next
}
