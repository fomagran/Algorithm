import Foundation

var selectedIndex:Int = 0
var linkedList = [[Int]]()
var removeHistory:[Int] = []

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    return makeResultByCommand(cmd: cmd, n: n,k: k)
}

func makeResultByCommand(cmd:[String],n:Int,k:Int) -> String {
    initialSetting(n: n,k:k)
    for command in cmd {
        changeByCommands(command: command)
    }

    var result = Array(repeating: "O", count: n)
    
    for r in removeHistory {
        result[r] = "X"
    }
    
    return result.joined()
}

func initialSetting(n:Int,k:Int) {
    selectedIndex = k
    for i in 0..<n {
        linkedList.append([i-1,i,i+1])
    }
}

func changeByCommands(command:String) {
    let split = command.components(separatedBy: " ")
    if command.first == "D" {
        moveColumn(x: Int(split.last!)!, isUp: false)
    }else if command.first == "U" {
        moveColumn(x: Int(split.last!)!, isUp: true)
    }else if command.first == "C" {
        removeColumn()
    }else {
        restoreColumn()
    }
}

func past(_ index:Int) -> Int {
    return linkedList[index][0]
}

func next(_ index:Int) -> Int{
    return linkedList[index][2]
}

func changeLinkedList(selected:Int) {
    linkedList[selected][1] = -1
    if past(selected) >= 0 {
        linkedList[past(selected)][2] = next(selected)
    }
    if next(selected) <= linkedList.count - 1 {
        linkedList[next(selected)][0] = past(selected)
    }
}

func moveColumn(x:Int,isUp:Bool){
    for _ in 0..<x {
        if isUp {
            selectedIndex = past(selectedIndex)
        }else {
            selectedIndex = next(selectedIndex)
        }
    }
}

func removeColumn() {
    changeLinkedList(selected: selectedIndex)
    removeHistory.append(selectedIndex)
    if next(selectedIndex) == linkedList.count {
        selectedIndex = past(selectedIndex)
    }else {
        selectedIndex = next(selectedIndex)
    }
}

func restoreColumn() {
    let restore = removeHistory.removeLast()
    if past(restore) >= 0 {
        linkedList[past(restore)][2] = restore
    }
    if next(restore) <= linkedList.count - 1 {
        linkedList[next(restore)][0] = restore
    }
}



solution(8, 2, ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"])

