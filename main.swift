func plusOne(_ digits: [Int]) -> [Int] {
    var answer:[Int] = digits
    var last:(Int,Int) = (0,0)

    for i in stride(from: digits.count-1, through: 0, by: -1) {
        last = (i,digits[i])
        answer[i] = answer[i] != 9 ? answer[i] + 1 : 0
        if answer[i] != 0 { break }
    }
    return last == (0,9) ? [1] + answer : answer
}

print(plusOne([0]))
