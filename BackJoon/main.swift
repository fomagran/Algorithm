//
//  main.swift
//  BackJoon
//
//  Created by Fomagran on 2022/01/06.
//

/*
 주어진 문자를 똑같이 붙여넣는다.
 붙여넣은 지점부터 하나씩 삭제해가며 중앙과 같은지 비교한다.
 */

var S:String = readLine()!
var T:String = readLine()!
var answer = 0

while T.count >= S.count {
    if S == T {
        answer = 1
        break
    }
    if T.first == "B" {
        T = String(T.reversed())
        T.removeLast()
        continue
    }
    T.removeFirst()
}

print(answer)
