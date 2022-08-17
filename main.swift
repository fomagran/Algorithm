func maxProfit(_ prices: [Int]) -> Int {
    var maxProfit: Int = 0
    
    for i in 0..<prices.count-1 {
        for j in i+1..<prices.count {
            maxProfit = max(maxProfit,prices[j] - prices[i])
        }
    }
    
    return maxProfit
}
