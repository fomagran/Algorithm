import Foundation

func solution(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    let jobs = setContentsLanguageScore(table: table)
    let scores:[String:Int] = setLangaugeScoreAndPreferenceSum(languages: languages, preference: preference, jobs: jobs)
    return findMaxJob(scores: scores)
}

func setContentsLanguageScore(table:[String]) -> [String:[String:Int]] {
    var jobs:[String:[String:Int]] = [:]
    table.forEach {
        let split = $0.split(separator: " ")
        let job = String(split[0])
        for (i,lang) in split.enumerated() {
            if i == 0 {
                jobs[job] = [:]
                continue
            }
            jobs[job]![String(lang)] = 6-i
        }
    }
    return jobs
}

func setLangaugeScoreAndPreferenceSum(languages:[String],preference:[Int],jobs:[String:[String:Int]]) -> [String:Int] {
    var scores:[String:Int] = [:]
    for (i,lang) in languages.enumerated() {
        for key in jobs.keys {
            let jobScore = jobs[key]?[lang] == nil ? 0 : jobs[key]![lang]!
            if scores[key] == nil {
                scores[key] = preference[i] * jobScore
            }else {
                scores[key]! += preference[i] * jobScore
            }
        }
    }
    return scores
}

func findMaxJob(scores:[String:Int]) -> String {
    var answer:[String] = []
    let max = scores.values.max()
    for score in scores {
        if score.value == max {
            answer.append(score.key)
        }
    }
    return answer.sorted().first!
}

solution(["SI JAVA JAVASCRIPT SQL PYTHON C#", "CONTENTS JAVASCRIPT JAVA PYTHON SQL C++", "HARDWARE C C++ PYTHON JAVA JAVASCRIPT", "PORTAL JAVA JAVASCRIPT PYTHON KOTLIN PHP", "GAME C++ C# JAVASCRIPT C JAVA"], ["PYTHON", "C++", "SQL"], [7,5,5])

