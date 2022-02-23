import Foundation

//nums의 길이에서 k+1을 뺀 숫자를 축으로 두 개로 나눈다.
//뒤에 있는 배열을 앞에 붙인다.

func rotate(_ nums: inout [Int], _ k: Int) {
    if nums.count == 1 { return }
    let k = k >= nums.count ? k-nums.count*(k/nums.count) : k
    let pivot:Int = nums.count-k-1
    let front:[Int] = Array(nums[0...pivot])
    let back:[Int] = Array(nums[pivot+1..<nums.count])
    nums = back + front
}

var nums = [1,2]
rotate(&nums, 5)
