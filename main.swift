class TrieNode {
    var children =  [Character: TrieNode]()
    var word: String = ""
}

func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    
    var answer = [String]()
    let root = TrieNode()
    var visited = [String: Bool]()
    
    func dfs(_ x: Int, _ y: Int, _ trieNode: TrieNode, _ visited:inout [String: Bool]) {
        if !trieNode.word.isEmpty {
            answer.append(trieNode.word)
            trieNode.word = ""
        }
               
        if !isInBoard(x, y) {
            return
        }
   
        if visited["\(x)\(y)"] != nil {
            return
        }
               
        let char = board[y][x]
        
        if trieNode.children[char] == nil {
            return
        }
 
        visited["\(x)\(y)"] = true
               
        let lrud = [(x-1,y),(x+1,y),(x,y-1),(x,y+1)]

        
        for d in lrud {
            dfs(d.0,d.1,trieNode.children[char]!,&visited)
        }
          
        visited["\(x)\(y)"] = nil
        
        if trieNode.children[char]!.children.isEmpty {
            trieNode.children[char] = nil
        }

    }
    
    func isInBoard(_ x: Int, _ y: Int) -> Bool {
        return 0..<board[0].count ~= x && 0..<board.count ~= y
    }
    
    func buildTrie() {
        for word in words {
            var current = root
            word.forEach {
                if current.children[$0] == nil {
                    current.children[$0] = TrieNode()
                }
                current = current.children[$0]!
            }
            current.word = word

        }
    }
    
    buildTrie()
    
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            dfs(j,i,root, &visited)
        }
    }
    
    return answer
    
}

print(findWords([["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], ["oath","pea","eat","rain"]))
