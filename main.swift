class Node {
    var key: Int
    var val: Int
    var prev: Node?
    var next: Node?
    
    init(_ key: Int ,_ val: Int) {
        self.key = key
        self.val = val
    }
}

class LRUCache {
    var head: Node?
    var tail: Node?
    var capacity = 0
    var cache = [Int: Node]()
    var count = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        if cache[key] != nil {
            lru(key)
        }
        return cache[key]?.val ?? -1
    }
    
    func put(_ key: Int, _ value: Int) {
        count += 1
        if head == nil {
            head = Node(key, value)
            tail = head
            cache[head!.key] = head
            return
        }
        
        if cache[key] == nil {
            cache[key] = Node(key,value)
        } else {
            count -= 1
            cache[key]?.val = value
        }
        
        if count > capacity {
            cache[tail!.key] = nil
            if head === tail {
                head = cache[key]
                tail = head
            } else {
                tail = tail?.prev
                tail?.next = nil
            }
            
            count -= 1
        }
        
        lru(key)
    }
    
    func lru(_ key:Int) {
        if head === cache[key] {
            return
        }
        
        if tail === cache[key] {
            tail = cache[key]?.prev
            tail?.next = nil
        } else {
            cache[key]?.prev?.next = cache[key]?.next
            cache[key]?.next?.prev = cache[key]?.prev
        }
        
        cache[key]?.next = head
        head?.prev = cache[key]
        head = cache[key]
        head?.prev = nil
    }
}
