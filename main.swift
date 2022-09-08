func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    let sortedPiles = piles.sorted{$0 < $1}

outer:for i in 0..<piles.count {
        let current = sortedPiles[i]
        var total = i
        
        for j in i..<piles.count {
           total += sortedPiles[j]%current == 0 ? sortedPiles[j]/current : sortedPiles[j]/current + 1
           if total > h {
               continue outer
           }
        }

      var left = i == 0 ? 1 : sortedPiles[i-1]
      var right = current
        
        while left <= right {
            let mid = (left + right)/2
            total = i
            
            for j in i..<piles.count {
                total += sortedPiles[j]%mid == 0 ? sortedPiles[j]/mid : sortedPiles[j]/mid + 1
            }
            
            if total > h {
                left = mid + 1
            } else {
                right = mid - 1
            }
            
        }
        
        return left
    }
    
    return 1
}

print(minEatingSpeed([31288470], 968709470))
