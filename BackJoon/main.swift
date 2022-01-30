var userDic:[Int:[String]] = [:]
let numberOfUser = Int(readLine()!)!
for _ in 0..<numberOfUser {
    let input = String(readLine()!)
    let split = input.split(separator: " ")
    let age = Int(split[0])!
    let name = "\(split[1])"
    addUser(age, name)
}

func addUser(_ age:Int,_ name:String) {
    if userDic[age] == nil {
        userDic[age] = [name]
    }else {
        userDic[age]!.append(name)
    }
}

let sort = userDic.sorted{$0.key < $1.key}
for user in sort {
    for name in user.value {
        print("\(user.key) \(name)")
    }
}
