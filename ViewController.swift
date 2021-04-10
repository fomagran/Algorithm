//
//  ViewController.swift
//  Algorithm
//
//  Created by Fomagran on 2021/01/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]))
    }


}

func solution(_ info:[String], _ query:[String]) -> [Int] {

    var counts = [Int]()
    var applicants = [[String]]()
    info.forEach{applicants.append($0.components(separatedBy: " "))}
    applicants.sort{Int($0[4])! > Int($1[4])!}
    
    var language = String()
    var backOrFront = String()
    var career = String()
    var food = String()
    
    var caseDic = [String:[Int]]()
    
    for applicant in applicants {
        language = applicant[0]
        backOrFront = applicant[1]
        career = applicant[2]
        food = applicant[3]
        let allCases = ["- and - and - and -",
                   "- and - and - and \(food)",
                   "- and - and \(career) and -",
                   "- and \(backOrFront) and - and -",
                   "\(language) and - and - and -",
                   "\(language) and - and - and \(food)",
                   "\(language) and \(backOrFront) and - and -",
                   "\(language) and - and \(career) and -",
                   "- and \(backOrFront) and \(career) and -",
                   "- and \(backOrFront) and - and \(food)",
                   "- and - and \(career) and \(food)",
                   "\(language) and \(backOrFront) and \(career) and -",
                   "\(language) and \(backOrFront) and - and \(food)",
                   "\(language) and - and \(career) and \(food)",
                   "- and \(backOrFront) and \(career) and \(food)",
                   "\(language) and \(backOrFront) and \(career) and \(food)"]
        for i in 0..<allCases.count {
            if caseDic[allCases[i]] != nil {
                caseDic[allCases[i]]!.append(Int(applicant[4])!)
            }else{
                caseDic[allCases[i]] = [Int(applicant[4])!]
            }
        }
    }
    
    for q in query {
        var count = 0
        var split = q.components(separatedBy: " ")
        let score = Int(split.removeLast())!
        let join = String(split.joined(separator: " "))
        if caseDic[join] == nil {
            counts.append(0)
        }else {
            for number in caseDic[join]! {
                if number >= score {
                    count += 1
                }else{
                    break
                }
            }
            counts.append(count)
        }
    }
    
    return counts
}

func closestValue(_ arr: [Int],_ target: Int) -> Int {

    guard arr.count > 1 else { return arr.firstIndex(of: abs(arr[0]))! }

    guard arr.first! <= target else {return 0 }
    guard target <= arr.last! else {return arr.count-1 }

    var left = 0
    var right = arr.count - 1

    while left < right {
        if left == right - 1 {
            return abs(arr[left] - target) <= abs(arr[right] - target) ? left + 1 : right
        }

        let middle = (left + right) / 2
        switch arr[middle] {
        case target:
            return middle
        case ..<target:
            left = middle
        default:
            right = middle
        }
    }
    return 0
}


