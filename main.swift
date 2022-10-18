class Trie {
    var children = [Character: Trie]()
    var isEnd: Bool = false
}

class WordDictionary {
    var root = Trie()
    
    init() {
        
    }
    
    func addWord(_ word: String) {
        var current = root
        
        word.forEach {
           if !current.children.keys.contains($0) {
                current.children[$0] = Trie()
            }
            
            current = current.children[$0]!
        }

        current.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        var queue = [root]
        
        word.forEach { c in
            if c == "." {
                queue = queue.flatMap { $0.children.values }
            } else {
                queue = queue.compactMap { $0.children[c] }
            }
        }

        return queue.contains(where: { $0.isEnd })
    }
}
