import Foundation

func solution(_ word:String) -> Int {
    let vowelsDic = ["A":0,"E":1,"I":2,"O":3,"U":4]
    let count = [781,156,31,6,1]

    return word.enumerated().map{count[$0.offset]*vowelsDic[String($0.element)]!}.reduce(word.count) {$0 + $1}
}

solution("I")
