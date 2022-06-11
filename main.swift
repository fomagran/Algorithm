/*
 ignore white space
 '-' negative, '+' positive
 stop non digit
 convert integer
 check -2^31 ~ 2^31-1 if the number is out of range return -2^31(less) or 2^31-1(greater)
 
 */

import Darwin

print(Int("s"))

func myAtoi(_ s: String) -> Int {
    var record:String = ""
    //2
    var negative:String = ""
    var trimS = s

    let stringMap:[Character] = s.map{$0}
    
    for c in stringMap {
        if c == "-" || c == "+"  {
            if Int(record) == nil && negative == "" {
            negative = String(c)
                continue
            }else {
                break
            }
        }
        
        //1
        if c == " " {
            if record == "" && negative == "" {
                continue
            }
            break
        }
        
        //3
        if Int(String(c)) == nil {
            break
        }
        
        record += String(c)
    }
    
    let min:Double = -pow(2, 31)
    let max:Double = pow(2,31)-1
    
    let answer:Double = negative != "-" ? (Double(record) ?? 0) : -(Double(record) ?? 0)
    
    if min...max ~= answer {
        return Int(answer)
    }
    
    return answer < min ? Int(min) : Int(max)
}

print(myAtoi("  +  413"))
