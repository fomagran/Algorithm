class TimeMap {
    var hashMap = [String:[(Int,String)]]()

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        hashMap[key,default:[]].append((timestamp,value))
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        if hashMap[key]?.first?.0 ?? Int.max > timestamp  {
            return ""
        } else {
            if hashMap[key]!.last!.0 > timestamp {
                return findClosestTimestamp(hashMap[key]!, timestamp)
            } else {
                return hashMap[key]!.last!.1
            }
        }
    }
    
    func findClosestTimestamp(_ timestamps: [(Int,String)], _ target: Int) -> String {
        var left = 0
        var right = timestamps.count - 1
        
        while left <= right {
            let mid = (left + right)/2
            
            if timestamps[mid].0 == target {
                return timestamps[mid].1
            } else if timestamps[mid].0 > target  {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return timestamps[right].1
    }
}


let timeMap = TimeMap()
timeMap.set("love", "high", 10);
timeMap.set("love", "low", 20);
print(timeMap.get("l", 5))
print(timeMap.get("love", 10))
//timeMap.set("foo", "bar2", 4)
print(timeMap.get("love", 15))
print(timeMap.get("love", 20))
print(timeMap.get("love", 25))
//print(timeMap.get("love", 5))
