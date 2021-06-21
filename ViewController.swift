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
        print(solution(3, 3, [[1,1,2,2],[1,2,2,3],[2,1,3,2],[2,2,3,3]]))
       
    }
}

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    //가장 작은 숫자들을 담을 배열
    var answer:[Int] = []
    //직사각형 숫자들을 담을 배열
    var rectangle:[[Int]] = makeRectangle(rows: rows, columns: columns)
    //회전된 직사각형 숫자들을 담을 배열
    var newRectangle:[[Int]] = rectangle
    //쿼리에 맞게 순회
    for q in queries {
        //테두리 숫자들을 담을 변수
        var borderNumbers:[Int] = []
        //위쪽 행과 아래쪽 행을 회전된 것에 맞게 바꿔줌.
        changeBorderColumns(start: (q[1]-1,q[0]-1), end: (q[3]-1,q[2]-1), newRectangle: &newRectangle,rectangle:&rectangle, answer: &answer,borderNumbers: &borderNumbers)
        //왼쪽 열과 오른쪽 열을 회전된 것에 맞게 바꿔줌.
        changeBorderRows(start: (q[1]-1,q[0]-1), end: (q[3]-1,q[2]-1), newRectangle: &newRectangle,rectangle:&rectangle, answer: &answer,borderNumbers: &borderNumbers)
        //직사각형 숫자를 회전한 사각형 숫자로 바꿈
        rectangle = newRectangle
        //테두리 숫자중 가장 작은 것을 넣어줌.
        answer.append(borderNumbers.min() ?? 0)
    }
    //가장 작은 숫자들을 반환해줌
    return answer
}

func makeRectangle(rows:Int,columns:Int) -> [[Int]]{
    //직사각형을 담을 배열
    var rectangle:[[Int]] = []
    //열 숫자만큼 행의 숫자들을 넣어줌.
    for row in 0..<rows {
        let col =  (1+(columns*row)...(columns*(row+1))).map{$0}
        rectangle.append(col)
    }
    //만들어진 직사각형을 반환
    return rectangle
}

func changeBorderColumns(start:(Int,Int),end:(Int,Int),newRectangle:inout [[Int]],rectangle:inout [[Int]],answer:inout [Int],borderNumbers:inout [Int]) {
    //테두리 위쪽에 있는 숫자들만 잘라줌
    let topCol = Array(newRectangle[start.1][start.0...end.0])
    //테두리 숫자들에 넣어줌.
    borderNumbers.append(contentsOf: topCol)
    //바뀔 숫자를 담아줄 배열을 만들어줌.
    var newTopCol:[Int] = topCol
    //테두리의 위쪽 행의 숫자들을 오른쪽으로 한칸씩 미뤄줌.
    for i in 0..<topCol.count-1{
        newTopCol[i+1] = topCol[i]
    }
    //테두리 위쪽 행에서 바로 아래행의 테두리 왼쪽숫자로 첫번째를 바꿔줌.
    newTopCol[0] = rectangle[start.1+1][start.0]
    //바뀐 숫자들로 대체해줌.
    newRectangle[start.1][start.0...end.0] = ArraySlice(newTopCol)
    //테두리 아래쪽에 있는 숫자들만 잘라줌
    let bottomCol = Array(newRectangle[end.1][start.0...end.0])
    //테두리 숫자들에 넣어줌.
    borderNumbers.append(contentsOf: bottomCol)
    //바뀔 숫자를 담아줄 배열을 바꿔줌.
    var newBottomCol:[Int] = bottomCol
    //테두리 아래 행의 숫자들을 왼쪽으로 한칸씩 미뤄줌.
    for i in 1...bottomCol.count-1{
        newBottomCol[i-1] = bottomCol[i]
    }
    //아래쪽 행의 바로 윗행에서 테두리 오른쪽 숫자로 마지막을 바꿔줌.
    newBottomCol[bottomCol.count-1] = rectangle[end.1-1][end.0]
    //바뀐 숫자들로 대체해줌.
    newRectangle[end.1][start.0...end.0] = ArraySlice(newBottomCol)
}

func changeBorderRows(start:(Int,Int),end:(Int,Int),newRectangle:inout [[Int]],rectangle:inout [[Int]],answer:inout [Int],borderNumbers:inout [Int]) {
    //만약 윗행과 아랫행의 간격이 1이상이 아니라면 사이의 행이 없으므로 넘어감.
    if abs(end.1 - start.1) <= 1 { return }
    //사이의 행만큼을 탐색
    for i in start.1+1...end.1-1 {
        //사이에 있는 행의 왼쪽 열 숫자를 추가해줌.
        borderNumbers.append(newRectangle[i][start.0])
        //사이에 있는 행의 오른쪽 열 숫자를 추가해줌.
        borderNumbers.append(newRectangle[i][end.0])
        //왼쪽 열 숫자를 위로 한칸씩 올려줌
        newRectangle[i][start.0] = rectangle[i+1][start.0]
        //오른쪽 열 숫자를 아래로 한칸씩 내려줌
        newRectangle[i][end.0] = rectangle[i-1][end.0]
    }
}
