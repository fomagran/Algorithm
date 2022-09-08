func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    
      var left = 1
      var right = 1000000000
        
        while left <= right {
            let mid = (left + right)/2
            var total = 0
            
            piles.forEach { pile in
                total += pile%mid == 0 ? pile/mid : pile/mid + 1
            }

            if total > h {
                left = mid + 1
            } else {
                right = mid - 1
            }
            
        }
    
    return left
}

print(minEatingSpeed([31288470], 968709470))
