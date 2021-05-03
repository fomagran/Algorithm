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
        
       print(solution([1,3,4], [true,false,true]))
    }
}

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer = 0

    for (i,isPositive) in signs.enumerated() {
        answer += isPositive ? absolutes[i] : -(absolutes[i])
    }
    
    return answer
}
