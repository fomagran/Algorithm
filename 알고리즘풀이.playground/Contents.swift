import Foundation

var answers:[Int] = []
var allDepth = Set<[Int]>()
var cardsCount:Int = 0

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    cardsCount = board.flatMap{$0}.filter{$0 != 0}.count
    let cards = findAllNumbersLocation(board: board)
    
    for card in cards.flatMap({$0}) {
        let count = moveCurrentToGoal(current: (c,r), goal: card, count: 0, board: board)
        startCardGame(board: board, start: card, count: count,depth:[])
    }
    
    let min = answers.min() ?? 0
    return min + cardsCount
}

func startCardGame(board:[[Int]],start:(Int,Int),count:Int,depth:[Int]) {
    
    if depth.count == cardsCount/2 {
        allDepth.insert(depth)
        answers.append(count)
        return
    }
    
    var newDepth = depth
    var newBoard = board
    
    let newGoals = findGoals(board: board, current: start)
    for goal in newGoals {
        
        if  newBoard[start.1][start.0] != 0 {
            newBoard[start.1][start.0] = 0
            newBoard[goal.1][goal.0] = 0
            newDepth.append(board[goal.1][goal.0])
        }
        
        let newCount = moveCurrentToGoal(current: start, goal: goal, count: count, board: newBoard)
        startCardGame(board: newBoard, start: goal, count: newCount,depth: newDepth)
    }
    
    return
}

func isGameOver(board:[[Int]]) -> Bool {
    return board.flatMap{$0}.filter{$0 != 0}.count == 0
}

func findAllNumbersLocation(board:[[Int]]) -> [[(Int,Int)]]{
    var newCards = Array(repeating: [(Int,Int)](), count: 7)
    for (y,row) in board.enumerated() {
        for (x,number) in row.enumerated() {
            if number != 0 {
                newCards[number].append((x,y))
            }
        }
    }
    return newCards
}

func moveCurrentToGoal(current:(Int,Int),goal:(Int,Int),count:Int,board:[[Int]]) -> Int{
    
    var minCount:Int = Int.max
    var queue:[((Int,Int),(Int,Int),Int,[[Int]])] = [(current,goal,count,board)]

    while !queue.isEmpty {
        let first = queue.removeFirst()
        print(first)
        moveBFS(current: first.0, goal: first.1, count: first.2,board: first.3, minCount: &minCount,queue:&queue)
    }
    
    return minCount
}


func findGoals(board:[[Int]],current:(Int,Int)) -> ([(Int,Int)]) {
    var goals:[(Int,Int)] = []
    
    let cards = findAllNumbersLocation(board: board)
    
    let number = board[current.1][current.0]
    for location in cards[number] {
        if location != current {
            goals.append(location)
            return goals
        }
    }
    
    goals = cards.flatMap{$0}.filter{$0 != current}
    
    return goals
}

func moveBFS(current:(Int,Int),goal:(Int,Int),count:Int,board:[[Int]],minCount:inout Int,queue: inout [((Int,Int),(Int,Int),Int,[[Int]])]){

    if count >= minCount {
        return
    }
    
    if current == goal{
        if minCount > count {
            minCount = count
        }
        return
    }
    
    let moves = [moveLeft(current: current),moveRight(current: current),moveUp(current: current),moveDown(current: current),moveCtrlLeft(goalX: goal.0, currentX: current.0, y: current.1, board: board),moveCtrlRight(goalX: goal.0, currentX: current.0, y: current.1, board: board),moveCtrlUp(goalY: goal.1, currentY: current.1,x: current.0,board: board),moveCtrlDown(goalY: goal.1, currentY: current.1,x: current.0,board: board)]
    
    for move in moves {
        if current.0 <= 4 && current.1 <= 4 && current.0 >= 0 && current.1 >= 0 {
            queue.append((move,goal,count+1,board))
        }
    }
    
    return
}

func moveLeft(current:(Int,Int)) -> (Int,Int) {
    return (current.0-1,current.1)
}

func moveRight(current:(Int,Int)) -> (Int,Int){
    return (current.0+1,current.1)
}

func moveDown(current:(Int,Int)) -> (Int,Int) {
    return (current.0,current.1+1)
}

func moveUp(current:(Int,Int)) -> (Int,Int) {
    return (current.0,current.1-1)
}

func moveCtrlLeft(goalX:Int,currentX:Int,y:Int,board:[[Int]]) -> (Int,Int) {
    if goalX >= currentX {
        return (5,5)
    }
    var newX = 0
    for x in goalX..<currentX {
        if board[y][x] != 0 {
            newX = x
        }
    }
    
    return (newX,y)
}

func moveCtrlRight(goalX:Int,currentX:Int,y:Int,board:[[Int]]) -> (Int,Int){
    if goalX <= currentX {
        return (5,5)
    }
    for x in currentX+1...goalX {
        if board[y][x] != 0 {
            return (x,y)
        }
    }
    
    return (3,y)
}

func moveCtrlUp(goalY:Int,currentY:Int,x:Int,board:[[Int]]) -> (Int,Int){
    if goalY >= currentY {
        return (5,5)
    }
    var newY = 0
    for y in goalY..<currentY {
        if board[y][x] != 0 {
            newY = y
        }
    }
    
    return (x,newY)
}

func moveCtrlDown(goalY:Int,currentY:Int,x:Int,board:[[Int]]) -> (Int,Int){
    if goalY <= currentY {
        return (5,5)
    }
    for y in currentY+1...goalY {
        if board[y][x] != 0 {
            return (x,y)
        }
    }
    
    return (x,3)
}

solution([[1,3,0,0],[2,4,4,0],[0,0,0,2],[3,0,1,0]],1,0)
