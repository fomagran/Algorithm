import Foundation


func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    
    var result:Set<[Int]> = []
    let banArray = findBanIdEqualUserId(userId: user_id, banId: banned_id)
    dfs(banArray:banArray,pickedArray:[],result: &result,current: 0)

    return result.count
}

func findBanIdEqualUserId(userId:[String],banId:[String]) -> [[Int]] {
    
    var banArray = Array(repeating: [Int](), count: banId.count)
    
    for (i,uid) in userId.enumerated() {
        for (j,bid) in banId.enumerated() {
            if isEqual(userId: uid, bannedId: bid) {
                banArray[j].append(i)
            }
        }
    }
    return banArray
}

func isEqual(userId:String,bannedId:String) -> Bool {
    if userId.count != bannedId.count { return false }
    
    let uid = userId.map{String($0)}
    let bid = bannedId.map{String($0)}
    
    for (i,b) in bid.enumerated() {
        if b != "*" && uid[i] != bid[i]  {
            return false
        }
    }
    return true
}

func dfs(banArray:[[Int]],pickedArray:Set<Int>,result:inout Set<[Int]>,current:Int) {
    for id in banArray[current] {
        var newPickedArray = pickedArray
        newPickedArray.insert(id)
        if current != banArray.count - 1 {
            dfs(banArray:banArray,pickedArray: newPickedArray,result:&result ,current: current+1)
        }else if current == banArray.count - 1 && newPickedArray.count == banArray.count {
            result.insert(newPickedArray.sorted())
        }
    }
}


solution(["frodo", "fradi", "crodo", "abc123", "frodoc"],["fr*d*", "*rodo", "******", "******"])


