struct Bridge {
    var start:Int,mid:Int,end:Int,min:Int
}

func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
    return getMinCount(rocks: rocks, n: n, distance: distance)
}

func getMinCount(rocks:[Int],n:Int,distance:Int) -> Int {
    let sortedRock:[Int] = rocks.sorted()
    var bridge = Bridge(start: 1, mid: 1+distance/2, end: distance,min: 0)
    while bridge.start <= bridge.end {
        bridge.mid = (bridge.start+bridge.end)/2
        print(bridge.mid)
        let count = getDeletedRockCount(sortedRock, bridge: bridge)
        print(count)
        updateBridgeLength(bridge: &bridge, count: count, n: n)
    }
    return bridge.min
}

func getDeletedRockCount(_ rocks:[Int],bridge:Bridge) -> Int {
    var prev = 0
    var count = 0
    for rock in rocks {
        if rock-prev < bridge.mid {
            count += 1
            continue
        }
        prev = rock
    }
    return count
}

func updateBridgeLength(bridge:inout Bridge,count:Int,n:Int) {
    if count > n {
        bridge.end = bridge.mid - 1
    }else {
        bridge.min = bridge.mid
        bridge.start = bridge.mid + 1
    }
}

solution(25, [2,14,11,21,17], 2)


