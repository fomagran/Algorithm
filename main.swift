/*
 ignore white space
 '-' negative, '+' positive
 stop non digit
 convert integer
 check -2^31 ~ 2^31-1 if the number is out of range return -2^31(less) or 2^31-1(greater)
 
 */

import Foundation

func myAtoi(_ s: String) -> Int {
    var record:String = ""
    var trimS = String(NSString(string: s.trimmingCharacters(in: .whitespaces)))
    var isNegative:Bool = false
    
    if trimS.first == "-" || trimS.first == "+" {
        isNegative = trimS.first == "-"
        trimS.removeFirst()
    }
    
    let stringMap:[Character] = trimS.map{$0}
    
    for c in stringMap {
        if Int(String(c)) == nil {
            break
        }
        record += String(c)
    }
    
    let min:Double = -pow(2, 31)
    let max:Double = pow(2,31)-1
    
    let answer:Double = !isNegative ? (Double(record) ?? 0) : -(Double(record) ?? 0)
    
    if min...max ~= answer {
        return Int(answer)
    }
    
    return answer < min ? Int(min) : Int(max)
}

print(myAtoi("  +  413"))
