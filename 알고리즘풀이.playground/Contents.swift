import Foundation

/*
 k를 음식 수 만큼으로 나눈다.
 나눈 숫자보다 작은 음식만큼 1부터 N까지 뺀다.
 나머지에 뺀 숫자들을 다 더하고 남은 음식들로 나눈다.
 
 1 2
 
 1 2 3
 
 1
 
 1 2
 
 1
 */

func solution(_ food_times:[Int], _ k:Int64) -> Int {
    
    var foodDic:[Int:Int] = [:]
    
    for (i,food) in food_times.enumerated() {
        foodDic[i+1] = food
    }
    
    var share = (k+1)/Int64(food_times.count)
    var remain = (k+1)%Int64(food_times.count)
    var foodCount = foodDic.count
    foodDic = foodDic.filter{$0.value > share}
    foodCount -= foodDic.count
    for (key,value) in foodDic {
        foodDic[key] = value-Int(share)
    }
    if foodCount >= 1 {
        for i in 1...foodCount {
            remain += Int64(i)
        }
    }
    
    share = remain/Int64(foodDic.count)
    remain = remain%Int64(foodDic.count)
    
    while remain > foodDic.count {
        foodDic = foodDic.filter{$0.value > share}
        foodCount -= foodDic.count
        for (key,value) in foodDic {
            foodDic[key] = value-Int(share)
        }
        if foodCount >= 1 {
            for i in 1...foodCount {
                remain += Int64(i)
            }
        }
        share = remain/Int64(foodDic.count)
        remain = remain%Int64(foodDic.count)
    }
    
    let sortFood = foodDic.sorted{$0.key < $1.key}
    
    return sortFood[Int(remain)].key
}

solution([3,1,2], 5)
