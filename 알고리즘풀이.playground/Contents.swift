import Foundation


var set:Set<[Int]> = []
var ban:[[Int]] = []
var setBan:Set<Int> = []
var banCount:Int = 0

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    
    ban = Array(repeating: [Int](), count: banned_id.count)
    banCount = banned_id.count
    
    for (i,uid) in user_id.enumerated() {
        for (j,bid) in banned_id.enumerated() {
            if isEqual(userId: uid, bannedId: bid) {
                ban[j].append(i)
                setBan.insert(i)
            }
        }
    }
    
    permuteWirth(Array(setBan).sorted(), banned_id.count)
    
    print(set)

    return set.count
}

func isEqual(userId:String,bannedId:String) -> Bool {
    if userId.count != bannedId.count { return false }
    let uid = userId.map{String($0)}
    let bid = bannedId.map{String($0)}
    
    for (i,b) in bid.enumerated() {
        if b == "*" {
            continue
        }else {
            if uid[i] != bid[i] {
                return false
            }
        }
    }
    return true
}


func permuteWirth(_ a: [Int], _ n: Int) {
    if n == 0 {
        let new = Array(a[0..<banCount])
        if isRightCombination(array: new, ban: ban) {
            set.insert(new.sorted())
        }
    } else {
        var a = a
        permuteWirth(a, n - 1)
        for i in 0..<n {
            a.swapAt(i, n)
            permuteWirth(a, n - 1)
            a.swapAt(i, n)
        }
    }
}

func isRightCombination(array:[Int],ban:[[Int]]) -> Bool {
    for (i,n) in array.enumerated() {
        if !ban[i].contains(n) {
            return false
        }
    }
    return true
}


solution(["frodo", "fradi", "crodo", "abc123", "frodoc"],["frodo", "fradi", "crodo", "abc123", "frodoc"])


