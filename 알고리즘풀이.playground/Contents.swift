import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var answer:Int = 0
    explore(dungeons: dungeons, answer: &answer, k:k, count: 0)
    return answer
}

func explore(dungeons:[[Int]],answer:inout Int,k:Int,count:Int) {
    answer = max(answer,count)
    for (i,dungeon) in dungeons.enumerated() {
        var newDungeons:[[Int]] = dungeons
        if dungeon[0] <= k && dungeon[1] <= k{
            let newK = k - dungeon[1]
            newDungeons.remove(at: i)
            explore(dungeons:newDungeons,answer: &answer,k: newK,count: count + 1)
        }
    }
}

solution(80, [[80,20],[50,40],[30,10]])
