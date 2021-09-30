import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    let sorted = sizes.map{$0.sorted()}
    return sorted.map{$0[0]}.max()! * sorted.map{$0[1]}.max()!
}

solution([[60, 50], [30, 70], [60, 30], [80, 40]])
solution([[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]])
solution([[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]]    )
