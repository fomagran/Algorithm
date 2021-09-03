import Foundation

struct Page {
    var index:Int
    var url:String
    var score:Double
    var externalLinks:[String]
    var linkScore:Double
}

func solution(_ word:String, _ pages:[String]) -> Int {
    
    var pageInfos:[Page] = []
    for (i,page) in pages.enumerated() {
        var pageInfo = Page(index:i,url: "", score: 0, externalLinks: [], linkScore: 0)
       let tags = page.split(separator: "<")
        var linkCount = 0
        var score:Double = -1
  

        for tag in tags {
            if String(tag.prefix(6)) == "meta p" {
                let content = tag.split(separator: " ").last!
                let url = content.split(separator: "\"")[1]
                pageInfo.url = String(url)
            }
            if String(tag.prefix(5)) == "/body" {
                pageInfo.score = score
                break
            }
            if String(tag.prefix(6)) == "a href" {
                let url = tag.split(separator: "\"")[1]
                pageInfo.externalLinks.append(String(url))
                linkCount += 1
            }
            
            if String(tag.prefix(4)) == "body" {
                score += 1
            }
            
            if score > -1 {
                let contains = tag.split(separator: " ").filter{$0.lowercased().contains(word.lowercased())}
                for contain in contains {
                    let new = contain.map{$0.isLetter ? String($0.lowercased()) : " "}.joined().split(separator: " ")
                   score += Double(new.filter{$0 == word.lowercased()}.count)
                }
            }
        }
        pageInfos.append(pageInfo)
    }
    
    for pageInfo in pageInfos {
        for link in pageInfo.externalLinks {
            let index = pageInfos.firstIndex{$0.url == link}
            if let index = index {
            let linkScore:Double = pageInfo.score/Double(pageInfo.externalLinks.count)
            pageInfos[index].linkScore += linkScore
            }
        }
    }
    
    let max = pageInfos.sorted{($0.score + $0.linkScore) > ($1.score + $1.linkScore)}.first

    let maxScore = max!.score + max!.linkScore
    
    for pageInfo in pageInfos {
        if pageInfo.score + pageInfo.linkScore == maxScore {
            return pageInfo.index
        }
    }
    
    return 0
}

solution("Muzi", ["<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://careers.kakao.com/interview/list\"/>\n</head>  \n<body>\n<a href=\"https://programmers.co.kr/learn/courses/4673\"></a>#!MuziMuzi!)jayg07con&&\n\n</body>\n</html>", "<html lang=\"ko\" xml:lang=\"ko\" xmlns=\"http://www.w3.org/1999/xhtml\">\n<head>\n  <meta charset=\"utf-8\">\n  <meta property=\"og:url\" content=\"https://www.kakaocorp.com\"/>\n</head>  \n<body>\ncon%\tmuzI92apeach&2<a href=\"https://hashcode.co.kr/tos\"></a>\n\n\t^\n</body>\n</html>"])
