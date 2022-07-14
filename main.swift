func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var stack: [Int] = []

  for num in nums {
    if stack.isEmpty {
        stack.append(num)
        continue
    }

    var left: Int = 0
    var right: Int = stack.count - 1

    while left <= right {
        let mid: Int = (left + right)/2
        let midValue: Int = stack[mid]

       if num == midValue {
            left = mid
            break
        } else if num > midValue {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    stack.insert(num,at:left)

    if stack.count > k {
        stack.removeLast()
    }
  }

  return stack.last!
}
