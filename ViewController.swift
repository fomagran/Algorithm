//
//  ViewController.swift
//  Algorithm
//
//  Created by Fomagran on 2021/01/07.
//

import UIKit

class ViewController: UIViewController {
    
    var 수박 = "수박"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
}


func solution(_ n:Int) -> String {
    
 
    var str = String()
     var su = "수"
    if n == 1 {
        return "수"
    }
    else if n%2 == 0 {
        for _ in 1...n/2{
            str += "수박"
        }
        return str
    }else{
        for _ in 1...n/2{
            su += "박수"
        }
        return su
    }
}
