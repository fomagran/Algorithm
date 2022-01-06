//
//  main.swift
//  BackJoon
//
//  Created by Fomagran on 2022/01/06.
//

var count:Int = 0
var max = (0,0)

while count < 9 {
    let n = Int(readLine() ?? "") ?? 0
    count += 1
    if max.1 < n {
        max = (count,n)
    }
}

print(max.1)
print(max.0)
