/*
 가운데 글자 기준으로 앞,뒤가 똑같을때
 절반이 앞,뒤가 똑같을때
 
 */
import Foundation


var str:[String] = []
var maxLength:Int = 0

func solution(_ s:String) -> Int {
    str = s.map{String($0)}

    var left:Int = s.count/2 - 1
    var right:Int = s.count/2
    
    while left > 0 {
        let min = 0
        let oddMax = left + left
        let evenMax = left + left + 1
        compareOdd(left: min, middle: left, right: oddMax)
        compareEven(left: min, middle: left, right: evenMax)
        left -= 1
    }
    
    while right < s.count-1 {
        let max = s.count - 1
        let oddMin = max - (max - right)
        let evenMin = right - (max - right) - 1
        compareOdd(left: oddMin, middle: right, right: max)
        compareEven(left: evenMin, middle: right, right: max)
        right += 1
    }
    
    return maxLength
}

func compareOdd(left:Int,middle:Int,right:Int) {
    var l = left
    var r = right
    while l < middle {
        if isEqual(left: l, middle: middle, right: r, isOdd: true) {
            maxLength = max(maxLength,r-l+1)
        }
        l += 1
        r -= 1
    }
}

func compareEven(left:Int,middle:Int,right:Int) {
    var l = left
    var r = right
    while l < middle {
        if isEqual(left: l, middle: middle, right: r, isOdd: false) {
            maxLength = max(maxLength,r-l+1)
        }
        l += 1
        r -= 1
    }
}


func isEqual(left:Int,middle:Int,right:Int,isOdd:Bool) -> Bool {
    print(left,middle,right,isOdd)
    var leftStr:ArraySlice<String>!
    var rightStr:ArraySlice<String>!
    if isOdd {
        leftStr = str[left...middle-1]
        rightStr = str[middle+1...right]
    }else {
        leftStr = str[left...middle]
        rightStr = str[middle+1...right]
    }
    return leftStr.joined() == rightStr.reversed().joined()
}

solution("aabb")
