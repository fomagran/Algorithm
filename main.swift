class TimeMap {
    var hashMap = [String:[(Int,String)]]()
    
    init() {
        
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        hashMap[key,default:[]].append((timestamp,value))
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        if hashMap[key,default:[]].isEmpty {
            return ""
        } else {
            if hashMap[key]!.first!.0 > timestamp {
                return ""
            }
            
            if hashMap[key]!.last!.0 > timestamp {
                var left = 0
                var right = hashMap[key]!.count - 1
                
                while left <= right {
                    let mid = (left + right)/2
                    
                    if hashMap[key]![mid].0 == timestamp {
                        return hashMap[key]![mid].1
                    } else if hashMap[key]![mid].0 > timestamp  {
                        right = mid - 1
                    } else {
                        left = mid + 1
                    }
                }
                return hashMap[key]![right].1
            } else {
                return hashMap[key]!.last!.1
            }
        }
    }
}


let timeMap = TimeMap()
timeMap.set("love", "high", 10);
timeMap.set("love", "low", 20);
print(timeMap.get("love", 5))
print(timeMap.get("love", 10))
//timeMap.set("foo", "bar2", 4)
print(timeMap.get("love", 15))
print(timeMap.get("love", 20))
print(timeMap.get("love", 25))
//print(timeMap.get("love", 5))
