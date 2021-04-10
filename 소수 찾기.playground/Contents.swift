import Foundation

func solution(_ dartResult:String) -> Int {
    
    var points = [Int]()
    
    for r in dartResult {
        switch r {
        case "S":
            points[points.count - 1] = Int(pow(Double(points[points.count - 1]),1))
        case "D":
            points[points.count - 1] = Int(pow(Double(points[points.count - 1]),2))
        case "T":
            points[points.count - 1] = Int(pow(Double(points[points.count - 1]),3))
        case "*":
            if points.count > 1 {
                points[points.count - 2] *= 2
            }
            points[points.count - 1] *= 2
        case "#":
            points[points.count - 1] *= -1
        default:
            
            if Int(String(r))! == 0 {
                if !points.isEmpty && points[points.count - 1] == 1 {
                    points[points.count - 1] = 10
                }else {
                    points.append(0)
                }
                continue
            }
            //숫자가 나왔을때
            points.append(Int(String(r))!)

        }
    }
    
    return points.reduce(0){$0 + $1}
}


