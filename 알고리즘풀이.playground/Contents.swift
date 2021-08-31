import Foundation

struct Car {
    var x:Int,y:Int,price:Int,prev:Direction?
}

enum Direction {
    case left,right,up,down
}

func solution(_ board:[[Int]]) -> Int {
    var visited:[[Int]] = Array(repeating: Array(repeating:Int.max, count: board.count), count: board.count)
    dfs(car: Car(x: 1, y: 0, price: 100, prev:.right),board: board,visited: &visited)
    dfs(car: Car(x: 0, y: 1, price: 100, prev:.down),board:board,visited: &visited)
    return visited.last!.last!
}

func dfs(car:Car,board:[[Int]],visited:inout [[Int]]) {
    let direction:[Direction:(Int,Int)] = [.right:(1,0),.left:(-1,0),.down:(0,1),.up:(0,-1)]
    if isEnabled(car: car, board: board, visited: visited) {
        visited[car.y][car.x] = car.price
        for (key,value) in direction {
            var newCar = Car(x: car.x + value.0, y: car.y+value.1, price: car.price, prev: key)
            newCar.price += car.prev == key ? 100 : 600
            dfs(car: newCar, board: board, visited: &visited)
        }
    }
}

func isEnabled(car:Car,board:[[Int]],visited:[[Int]]) -> Bool {
    return 0..<board.count ~= car.x && 0..<board.count ~= car.y && car.price <= visited[car.y][car.x] && board[car.y][car.x] == 0
}

solution([[0, 0, 0, 0, 0], [0, 1, 1, 1, 0], [0, 0, 1, 0, 0], [1, 0, 0, 0, 1], [0, 1, 1, 0, 0]])
