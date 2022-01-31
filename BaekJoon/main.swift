var word = String(readLine()!)
let vowels = ["a","e","i","o","u"]

while word != "end" {
    let map = word.map{String($0)}
    var consonantCount = 0
    var vowelCount = 0
    var consLetters:[String] = []
    var isAcceptable = false
    
    for s in map {
        if vowels.contains(s) {
            consonantCount = 0
            vowelCount += 1
            isAcceptable = true
        }else {
            vowelCount = 0
            consonantCount += 1
        }
        if consonantCount == 3 || vowelCount == 3 {
            isAcceptable = false
            break
        }
        if !consLetters.isEmpty && consLetters.last! == s && s != "e" && s != "o" {
            isAcceptable = false
            break
        }
        consLetters.append(s)
    }
    if isAcceptable {
        print("<\(word)> is acceptable.")
    }else {
        print("<\(word)> is not acceptable.")
    }
    word = String(readLine()!)
}


