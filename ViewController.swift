//
//  ViewController.swift
//  Algorithm
//
//  Created by Fomagran on 2021/01/07.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(solution([[1,0,0,3],[2,0,0,0],[0,0,0,2],[3,0,1,0]],1,0))
        print(solution([[3,0,0,2],[0,0,1,0],[0,1,0,0],[2,0,0,3]],0,1))
        
    }
}

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    
    //정답
    var answer = Int.max
    //카드 갯수
    var cardsCount:Int = 0
    
    //board 전체를 탐색해 0이 아닌 숫자를 세준다.(카드의 갯수)
    cardsCount = board.flatMap{$0}.filter{$0 != 0}.count
    
    //카드의 위치가 어딨는지 찾음.
    let cards = findAllNumbersLocation(board: board)
    
    //카드게임 시작
    startCardGame(answer:&answer,cardsCount:&cardsCount,board: board, start: (c,r), count: 0, cards: cards,depth:[])
    
    //어차피 카드 갯수만큼 enter를 하므로 카드 갯수만큼 더해준다.
    return answer + cardsCount
}


func startCardGame(answer:inout Int,cardsCount:inout Int,board:[[Int]],start:(Int,Int),count:Int,cards:[[(Int,Int)]],depth:[Int]) {
    
    //count가 answer보다 크면 더 이상 진행할 필요 없으므로 return
    if answer != Int.max && count >= answer {
        return
    }
    
    //depth가 카드의 갯수/2는 즉 모든 카드를 뒤집은 것이고 && count가 answer보다 작을때
    if depth.count == cardsCount/2 && answer > count {
        //answer를 count로 만들어준다.
        answer = count
        return
    }
    
    //카드를 탐색
    for (i,card) in cards.enumerated(){
        
        //새로운 보드
        var newBoard = board
        //새로운 뎁스
        var newDepth = depth
        //새로운 카드
        var newCards = cards
        
        //카드가 비었다면 진행하지 않음
        if card.isEmpty { continue }
        
        //시작부터 첫번째 카드까지 첫번재 카드부터 두번째 카드까지의 count
        let count1 = moveCurrentToGoal(current: start, goal: card[0], count: 0, board: board) + moveCurrentToGoal(current: card[0], goal: card[1], count: 0, board: board)
        //시작부터 두번째 카드까지 두번째 카드부터 첫번째 카드까지의 count
        let count2 = moveCurrentToGoal(current: start, goal: card[1], count: 0, board: board) + moveCurrentToGoal(current: card[1], goal: card[0], count: 0, board: board)
        
        //해당 번호의 카드를 모두 없애준다.
        newCards[i] = []
        //보드에서 첫번째 카드 위치를 숫자를 0으로 만들어준다.
        newBoard[card[0].1][card[0].0] = 0
        //보드에서 두번째 카드 위치를 숫자를 0으로 만들어준다.
        newBoard[card[1].1][card[1].0] = 0
        //뎁스에 번호를 추가해준다.
        newDepth.append(i)
        
        //count1과 count2 중 더 작은 것을 count에 더해주고 startCardGame을 재귀해줌.
        if count1 < count2 {
            startCardGame(answer:&answer,cardsCount:&cardsCount,board: newBoard, start: card[1], count: count + count1, cards: newCards,depth: newDepth)
        }else {
            startCardGame(answer:&answer,cardsCount:&cardsCount,board: newBoard, start: card[0], count: count + count2, cards: newCards,depth: newDepth)
        }
    }
}

//모든 숫자들의 위치를 찾는 함수
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

//현재부터 목적지까지 가는 함수
func moveCurrentToGoal(current:(Int,Int),goal:(Int,Int),count:Int,board:[[Int]]) -> Int{
    
    //가장 작은 count를 담을 변수
    var minCount = Int.max
    //BFS구현을 위한 변수
    var queue:[((Int,Int),(Int,Int),Int,[[Int]])] = [(current,goal,count,board)]
    //방문이력이 있는지 확인할 변수
    var visited:[[Bool]] = Array(repeating: Array(repeating:false, count: 4), count: 4)
    
    //큐가 비지 않앗다면
    while !queue.isEmpty {
        //minCount가 Int.max가 아니란 것은 어떤 숫자가 들어왔다는 의미이므로
        if minCount != Int.max {
            //minCount를 return 해준다.
            return minCount
        }
        //queue의 가장 첫번째를 삭제해주면서 저장함.
        let first = queue.removeFirst()
        //가장 큐의 가장 첫번째 있는 값을 BFS에 넣어줌.
        moveBFS(current: first.0, goal: first.1, count: first.2,board: first.3,minCount:&minCount,queue:&queue,visited: &visited)
    }
    
    return minCount
}

//BFS로 현재부터 목적지까지 이동하는 함수
func moveBFS(current:(Int,Int),goal:(Int,Int),count:Int,board:[[Int]],minCount:inout Int,queue: inout [((Int,Int),(Int,Int),Int,[[Int]])],visited:inout [[Bool]]) {
    
    //방문했거나 현재 위치가 벽보다 더 바깥이면 return
    if current.0 > 3 || current.1 > 3 || current.0 < 0 || current.1 < 0 {
        return
    }
    
    //방문한 적이 없다면 해당 위치를 true로 바꿔준다.
    if visited[current.1][current.0] == false {
        visited[current.1][current.0] = true
    }else {
        //방문했다면 return
        return
    }
    
    //현재위치가 목적지와 같다면 minCount를 count로 바꿔준다.
    if current == goal{
        minCount = count
        return
    }
    
    //왼쪽,오른쪽,위쪽,아래쪽 ctrl + 왼쪽,오른쪽,위쪽,아래쪽 8가지 이동을 담은 변수
    let moves = [moveLeft(current: current),moveRight(current: current),moveUp(current: current),moveDown(current: current),moveCtrlLeft(goalX: goal.0, currentX: current.0, y: current.1, board: board),moveCtrlRight(goalX: goal.0, currentX: current.0, y: current.1, board: board),moveCtrlUp(goalY: goal.1, currentY: current.1,x: current.0,board: board),moveCtrlDown(goalY: goal.1, currentY: current.1,x: current.0,board: board)]
    
    //8가지 이동을 모두 해준다.
    for move in moves {
        //현재 위치가 벽 안에 있다면
        if current.0 <= 3 && current.1 <= 3 && current.0 >= 0 && current.1 >= 0 {
            //큐에 넣어준다.
            queue.append((move,goal,count+1,board))
        }
    }
    
}

//왼쪽으로 1칸 이동
func moveLeft(current:(Int,Int)) -> (Int,Int) {
    return (current.0-1,current.1)
}

//오른쪽으로 1칸 이동
func moveRight(current:(Int,Int)) -> (Int,Int){
    return (current.0+1,current.1)
}

//아래쪽으로 1칸 이동
func moveDown(current:(Int,Int)) -> (Int,Int) {
    return (current.0,current.1+1)
}

//위쪽으로 1칸 이동
func moveUp(current:(Int,Int)) -> (Int,Int) {
    return (current.0,current.1-1)
}

//ctrl + 왼쪽으로 이동
func moveCtrlLeft(goalX:Int,currentX:Int,y:Int,board:[[Int]]) -> (Int,Int) {
    //왼쪽으로 이동해야하는데 목적지의 x가 현재 위치의 x보다 더 작거나 같으면 안되므로 벽 바깥으로 밀어버림.
    if goalX >= currentX {
        return (4,4)
    }
    
    var newX = 0
    //목적지와 현재 x의 위치 사이에
    for x in goalX..<currentX {
        //숫자가 있다면
        if board[y][x] != 0 {
            //newX를 해당 숫자로 바꿔줌
            newX = x
        }
    }
    //숫자가 없다면 0으로 가장 왼쪽으로 옮김
    return (newX,y)
}

//ctrl + 오른쪽으로 이동
func moveCtrlRight(goalX:Int,currentX:Int,y:Int,board:[[Int]]) -> (Int,Int){
    if goalX <= currentX {
        return (4,4)
    }
    for x in currentX+1...goalX {
        if board[y][x] != 0 {
            return (x,y)
        }
    }
    
    return (3,y)
}

//ctrl + 위쪽으로 이동
func moveCtrlUp(goalY:Int,currentY:Int,x:Int,board:[[Int]]) -> (Int,Int){
    if goalY >= currentY {
        return (4,4)
    }
    var newY = 0
    for y in goalY..<currentY {

        if board[y][x] != 0 {
            newY = y
        }
    }
    
    return (x,newY)
}

//ctrl + 아래쪽으로 이동
func moveCtrlDown(goalY:Int,currentY:Int,x:Int,board:[[Int]]) -> (Int,Int){
    if goalY <= currentY {
        return (4,4)
    }
    for y in currentY+1...goalY {
        if board[y][x] != 0 {
            return (x,y)
        }
    }
    
    return (x,3)
}
