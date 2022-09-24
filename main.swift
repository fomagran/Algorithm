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
        if let _ = cache[key] {
            replace(key)
        }
        return cache[key]?.val ?? -1
    }
    
    func put(_ key: Int, _ value: Int) {
        count += 1
        if head == nil {
            head = Node(key, value)
            tail = head
            cache[key] = head
            return
        }
        
        if cache[key] == nil {
            cache[key] = Node(key,value)
        } else {
            count -= 1
            cache[key]?.val = value
        }
        
        if count > capacity {
            delete(key)
        }
        
        if head !== cache[key] {
            replace(key)
        }
    }
    
    func insert(_ key: Int) {
        cache[key]?.next = head
        head?.prev = cache[key]
        head = cache[key]
        head?.prev = nil
    }
    
    func delete(_ key: Int) {
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
    
    func replace(_ key: Int) {
        cache[key]?.prev?.next = cache[key]?.next
        cache[key]?.next?.prev = cache[key]?.prev
        tail = cache[key] === tail ? cache[key]?.prev : tail
        insert(key)
    }
}
