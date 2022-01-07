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

check(T)


func check(_ t:String) {
    if t == S {
        answer = 1
        return
    }
    if t.count <= S.count || answer == 1 {
        return
    }
    if t.first == "A" && t.last == "A" {
       check(removeA(t))
    }else if t.first == "A" && t.last == "B" {
        return
    }else if t.first == "B" && t.last == "A" {
        check(removeA(t))
        check(removeB(t))
    }else {
        check(removeB(t))
    }
}

func removeB(_ s:String) -> String {
    var new = s
    new = String(new.reversed())
    new.removeLast()
    return new
}

func removeA(_ s:String) -> String {
    var new = s
    new.removeLast()
    return new
}

print(answer)
