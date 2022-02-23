import Foundation

//배열을 sorting
//가장 큰 숫자부터 차례대로 가장 작은 숫자부터 더해서 target을 넘억가면 out

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let map = nums.enumerated().map{$0}
    let sorted = map.sorted{$0.element <  $1.element}
    let reverse = sorted.reversed()
    for large in reverse {
        for small in sorted {
            if large.element + small.element == target {
                return [small.offset,large.offset]
            }
            if large.element + small.element > target {
                break
            }
        }
    }
    return []
}

print(twoSum([2,7,11,15], 9))
