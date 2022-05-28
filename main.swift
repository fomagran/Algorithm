func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dic:[String:[String]] = [:]
    for str in strs {
        let sort = str.map{String($0)}.sorted().joined()
        if dic[sort] == nil {
            dic[sort] = [str]
        }else {
            dic[sort]!.append(str)
        }
    }
    return Array(dic.values)
}

groupAnagrams(["eat","tea","tan","ate","nat","bat"])
