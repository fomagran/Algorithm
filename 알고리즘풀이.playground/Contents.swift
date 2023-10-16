import Foundation

func solution(_ elements:[Int]) -> Int {
    var allSum: [Int] = [elements[0]]
    let elementsLength = elements.count
    var set = Set<Int>()
    
    for i in 1..<elements.count {
        allSum.append(allSum[i-1] + elements[i])
    }
    
    for i in elementsLength..<elementsLength + elementsLength {
        allSum.append(allSum[i-1] + elements[i - elementsLength])
    }
    
    
    for i in 1..<elementsLength {
        for j in 0..<elementsLength {
            let end = j + i
            set.insert(allSum[end] - allSum[j])
        }
    }
    
    return set.count + 1
}

solution([7,9,1,1,4])

//7 9 1 1 1
//7 16 17 18 19 26 35 36 37 38
