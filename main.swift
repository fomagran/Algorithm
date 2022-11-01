func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var tasksCountDic = [Character: Int]()
    var least = 0
    
    tasks.forEach {
        tasksCountDic[$0, default: 0] += 1
    }
    
    var queue = [Int]()
    
    for task in tasksCountDic.values {
        insert(task, &queue)
    }
    
    while !queue.isEmpty {
        var time = 0
        var removedTasks = [Int]()
        
        for _ in 0...n {
            if !queue.isEmpty {
                let task = remove(&queue)
                time += 1
                removedTasks.append(task-1)
            }
        }
        
        for removedTask in removedTasks {
            if removedTask > 0 {
                insert(removedTask,&queue)
            }
        }
        
        least += queue.isEmpty ? time : n+1
    }
    
    return least
}

func insert(_ task: Int, _ tasks: inout [Int]) {
    tasks.append(task)
    var index = tasks.count - 1
    
    while (index-1)/2 >= 0 && tasks[(index-1)/2] < tasks[index] {
        tasks.swapAt((index-1)/2,index)
        index = (index-1)/2
    }
}

func remove(_ tasks: inout [Int]) -> Int {
    if tasks.isEmpty {
        return 0
    }
    
    tasks.swapAt(0, tasks.count - 1)
    let last = tasks.removeLast()
    
    var index = 0
    
    while 2 * index + 1 < tasks.count {
        let leftChildIndex = 2 * index + 1
        let rightChildIndex = 2 * index + 2
        var largeChildIndex = leftChildIndex
        
        if rightChildIndex < tasks.count && tasks[leftChildIndex] < tasks[rightChildIndex] {
            largeChildIndex = rightChildIndex
        }
        
        if tasks[index] > tasks[largeChildIndex] {
            break
        } else {
            tasks.swapAt(index, largeChildIndex)
        }
        index = largeChildIndex
    }
    
    return last
}

print(leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"]
                    ,2))
