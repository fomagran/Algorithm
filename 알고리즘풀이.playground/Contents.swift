struct MaxHeap {
    var nodes: [Int] = []
    
    init(nodes: [Int]) {
        nodes.forEach {
            insert($0)
        }
    }
    
    private func leftChild(_ parent: Int) -> Int {
        return 2 * parent + 1
    }
    
    private func rightChild(_ parent: Int) -> Int {
        return 2 * parent + 2
    }
    
    func parent(_ child: Int) -> Int {
        return (child - 1) / 2
    }
    
    private func hasLeft(_ index: Int) -> Bool {
        return leftChild(index) < nodes.count
    }
    
    private func hasRight(_ index: Int) -> Bool {
        return rightChild(index) < nodes.count
    }
    
    private func hasParent(_ index: Int) -> Bool {
        return parent(index) >= 0
    }
    
    mutating func insert(_ node: Int) {
        nodes.append(node)
        
        var index = nodes.count - 1
        
        while hasParent(index) && nodes[parent(index)] < nodes[index] {
            nodes.swapAt(parent(index), index)
            index = parent(index)
        }
    }
    
    mutating func remove() {
        if nodes.isEmpty {
            return
        }
        
        nodes.swapAt(0, nodes.count - 1)
        nodes.removeLast()
        
        var index: Int = 0
        
        while hasLeft(index) {
            let left =  leftChild(index)
            let right = rightChild(index)
            
            var bigger = left
            
            if hasRight(index) && nodes[left] < nodes[right] {
                bigger = right
            }
            
            if nodes[index] <= nodes[bigger] {
                nodes.swapAt(index, bigger)
                index = bigger
                continue
            }
            
            break
        }
    }
}

var heap = MaxHeap(nodes: [1,5,3]) //[5,1,3]
heap.insert(4) //[5,4,3,1]
heap.insert(2) //[5,4,3,1,2]
heap.insert(1) //[5,4,3,1,2,1]
heap.insert(2) //[5,4,3,1,2,1,2]
heap.remove() //[4,2,3,1,2,1]
heap.remove() //[3,2,1,1,2]
heap.remove() //[2,2,1,1]
heap.insert(7) //[7, 2, 1, 1, 2]
heap.insert(5) //[7, 2, 5, 1, 2, 1]
print(heap.nodes)
