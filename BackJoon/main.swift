//
//  main.swift
//  BackJoon
//
//  Created by Fomagran on 2022/01/06.
//

import Foundation

let line = readLine() ?? ""
let lineArr = line.split(separator: " ").map{String($0)}
var A = Array(lineArr[0].map{String($0)}.reversed())
var B = Array(lineArr[1].map{String($0)}.reversed())
var isALong = A.count > B.count
let addZero = Array(repeating: "0", count: abs(A.count-B.count))

A = isALong ? A : A + addZero
B = isALong ? B + addZero : B

var remain = 0
var answer:[String] = []
let count = isALong ? A.count : B.count

for i in 0..<count {
    let sum = Int(A[i])! + Int(B[i])! + remain
    remain = sum/10
    if i == count - 1 {
        answer.append(String(sum))
    }else {
        answer.append(String(sum%10))
    }
}

print(Array(answer.reversed()).joined())
