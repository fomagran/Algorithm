func maxProfit(_ prices: [Int]) -> Int {
    var minValue: Int = Int.max
    var maxProfit: Int = 0
    
    for price in prices {
        minValue = min(minValue,price)
        maxProfit = max(maxProfit,price - minValue)
    }
    
    return maxProfit
}
