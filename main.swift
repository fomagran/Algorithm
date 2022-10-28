func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var taskDic = [Character: Int]()
    var lastDic = [Character: Int]()
    var current = 0

    tasks.forEach {
        taskDic[$0,default:0] += 1
        lastDic[$0] = Int.min
    }
    
    outer: while !taskDic.isEmpty {
        for (task,_) in taskDic {

            if lastDic[task]! < current - n {
                lastDic[task] = current
                taskDic[task]! -= 1

                if taskDic[task]! == 0 {
                    taskDic[task] = nil
                }
                
                current += 1
                continue outer
            }
        }
        
        current += 1

    }
    
    return current
}

//print(leastInterval(["A","A","A","B","B","B"], 2))
//print(leastInterval(["A","A","A","B","B","B"], 0))
print(leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2))
