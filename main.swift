func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
  var tasksCountDic = [Character: Int]()
  var least = 0

  tasks.forEach {
    tasksCountDic[$0, default: 0] += 1
  }

  var queue = tasksCountDic.map { ($0.key, $0.value) }.sorted { $0.1 > $1.1 }

  while !queue.isEmpty {
    var time = 0
    var removedTasks = [(Character, Int)]()

    for i in 0...n {
      if !queue.isEmpty {
        let task = queue.removeFirst()
        time += 1
        removedTasks.append((task.0,task.1-1))
      }
    }

    for removedTask in removedTasks {
      if removedTask.1 > 0 {
        insert(removedTask,&queue)
      }
    }
    
    least += queue.isEmpty ? time : n+1

  }

  return least
}

func insert(_ task: (Character, Int), _ tasks: inout [(Character, Int)]) {
  var left = 0
  var right = tasks.count - 1

  while left <= right {
    let mid = (left + right)/2

    if tasks[mid].1 == task.1 {
      left = mid + 1
      break
    } else if tasks[mid].1 > task.1 {
      left = mid + 1
    } else {
      right = mid - 1
    }
  }

  tasks.insert(task,at: left)
}

//print(leastInterval(["A","A","A","B","B","B"], 2))
//print(leastInterval(["A","A","A","B","B","B"], 0))
print(leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2))
