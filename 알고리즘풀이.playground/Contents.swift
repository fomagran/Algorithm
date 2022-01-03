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
    let root:Node = Node(value:"")
    
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
        for w in map {
            if !current.children.keys.contains(w) {
                return 0
            }
            current = current.children[w]!
        }
        return current.count == 0 ? 1 : current.count
    }
}

struct Tries {
    var trie:Trie,reverse:Trie
}

func solution(_ words:[String], _ queries:[String]) -> [Int] {
    let lengthDic:[Int:Tries] = classifyByWordLength(words)
    return queriesResults(queries,lengthDic)
}

func classifyByWordLength(_ words:[String]) -> [Int:Tries] {
    var lengthDic:[Int:Tries] = [:]
    for word in words {
        if lengthDic[word.count] == nil {
            let tries = Tries(trie: Trie(), reverse: Trie())
            tries.trie.insert(word)
            tries.reverse.insert(String(word.reversed()))
            lengthDic[word.count] = tries
        }else {
            lengthDic[word.count]!.trie.insert(word)
            lengthDic[word.count]!.reverse.insert(String(word.reversed()))
        }
    }
    return lengthDic
}

func queriesResults(_ queries:[String],_ lengthDic:[Int:Tries]) -> [Int] {
    var results:[Int] = []
    for query in queries {
        let count = query.count
        if lengthDic[count] == nil {
            results.append(0)
            continue
        }
        var pre = query.map{String($0)}.filter{$0 != "?"}.joined()
        pre = query.first == "?" ? String(pre.reversed()) : pre
        let trie = query.first == "?" ? lengthDic[count]!.reverse : lengthDic[count]!.trie
        let result = trie.getCount(pre)
        results.append(result)
    }
    return results
}

solution(["frodo", "front", "frost", "frozen", "frame", "kakao"],["fro??", "????o", "fr???", "fro???", "pro?","frozee","f????","?????"])
