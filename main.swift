class Node {
    var value:Character

    var children:[Character:Node] = [:]
    
    init(value:Character) {
        self.value = value
    }
    
    func append(_ value:Character) {
        self.children[value] = Node(value: value)
    }
}

class Trie {
    
    var root: Node = Node(value: " ")
    
    init() {
    }
    
    func insert(_ word: String) {
        let map = word.map{$0}
        var current = root
        
        map.forEach {
            if !current.children.keys.contains($0) {
                current.append($0)
            }
            current = current.children[$0]!
        }
        current.append("?")
    }
    
    func search(_ word: String) -> Bool {
        let map = word.map{$0}
        var current = root
        for c in map {
            if !current.children.keys.contains(c) {
                return false
            }
            current = current.children[c]!
        }
        return current.children.keys.contains("?")
    }
    
    func startsWith(_ prefix: String) -> Bool {
        let map = prefix.map{$0}
        var current = root
        for c in map {
            if !current.children.keys.contains(c) {
                return false
            }
            current = current.children[c]!
        }
        return true
    }
}




