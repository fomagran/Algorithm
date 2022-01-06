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

import Foundation

var str = readLine()!
var newStr = (str + str.reversed()).map{String($0)}
var start = str.count
var min = Int.max

func isPalindrome(_ str:[String]) -> Bool {
    let middle = str.count%2 == 0 ? str.count/2-1 : str.count/2
    let head = str[0...middle].joined()
    let tail = str[str.count/2..<str.count].reversed().joined()
    return head == tail
}

while newStr.count >= str.count {
    if isPalindrome(newStr) {
        min = newStr.count
    }
    if newStr.count == str.count {
        break
    }
    newStr.remove(at: start)
}

print(min)

