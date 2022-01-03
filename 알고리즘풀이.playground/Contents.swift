import Foundation

class Node {
    var value:String
    var count:Int = 0
    var children:[String:Node] = [:]
    init(value:String) {
        self.value = value
    }
    
    func append(_ value:String) {
        self.children[value] = Node(value: value)
    }
}

class Trie {
    let root:Node
    
    init() {
        self.root = Node(value:"")
    }
    
    func insert(_ word:String) {
        var current = root
        let map = word.map{String($0)}
        map.forEach {
            current.count += 1
            if !current.children.keys.contains($0) {
                current.append($0)
            }
            current = current.children[$0]!
        }
    }
    
    func getCount(_ word:String) -> Int {
        var current = root
        let map = word.map{String($0)}
        var check = false
        for w in map {
            if current.children.keys.contains(w) {
                current = current.children[w]!
            }else {
                check = true
            }
        }
        return check ? 0 : current.count == 0 ? 1 : current.count
    }
}

func solution(_ words:[String], _ queries:[String]) -> [Int] {
    var lengthDic:[Int:[Trie]] = [:]
    var results:[Int] = []
    
    for word in words {
        if lengthDic[word.count] == nil {
            let trie = Trie()
            let reverse = Trie()
            trie.insert(word)
            let reveseWord = String(word.reversed())
            reverse.insert(reveseWord)
            lengthDic[word.count] = [trie,reverse]
        }else {
            lengthDic[word.count]![0].insert(word)
            let reveseWord = String(word.reversed())
            lengthDic[word.count]![1].insert(reveseWord)
        }
    }
    
    for query in queries {
        let count = query.count
        let pre = query.map{String($0)}.filter{$0 != "?"}.joined()
        let isReverse = query.first == "?"
        var result = 0
        if lengthDic[count] == nil {
            results.append(0)
            continue
        }
        if isReverse {
            result = lengthDic[count]![1].getCount(String(pre.reversed()))
        }else {
            result = lengthDic[count]![0].getCount(pre)
        }

        results.append(result)
    }

    return results
}

solution(["frodo", "front", "frost", "frozen", "frame", "kakao"],["fro??", "????o", "fr???", "fro???", "pro?","frozee","f????","?????"])
