func evalRPN(_ tokens: [String]) -> Int {
    var stack = [Int]()
    
    for token in tokens {
        if Int(token) != nil {
             stack.append(Int(token)!)
            continue
        }
        
        let number1 = stack.removeLast()
        let number2 = stack.removeLast()
        
        if token == "+" {
            stack.append(number2+number1)
        } else if token == "-" {
            stack.append(number2-number1)
        } else if token == "*" {
            stack.append(number2*number1)
        } else if token == "/" {
            stack.append(Int(number2/number1))
        }
    }
    
    return stack.last!
}
