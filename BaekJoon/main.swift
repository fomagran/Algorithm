import Foundation

let n:Int = Int(readLine()!)!
var start = Array(repeating:" ", count: n)
func staircase(n: Int) {
    for i in 1...n {
        start[n-i] = "#"
        print(start.joined())
    }
}
staircase(n: n)



