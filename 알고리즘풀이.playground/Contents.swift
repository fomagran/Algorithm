func solution(prices: [Int]) -> [Int] {
    var answer: [Int] = Array(repeating: 0, count: prices.count)
    var stack: [[Int]] = []
    
    for (i,price) in prices.enumerated() {
        if stack.isEmpty {
            stack.append([i,price])
            continue
        }
        
        if stack.last![1] > price {
            while !stack.isEmpty && stack.last![1] > price {
               let last = stack.removeLast()
                answer[last[0]] = i - last[0]
            }
        }
        
        stack.append([i,price])
    }
    
    for n in stack {
        answer[n[0]] = prices.count - n[0] - 1
    }
    
    return answer
}

solution(prices: [1,2,3,2,3])
