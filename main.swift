func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var point1:Int = 0
    var point2:Int = 0
    let allCount = nums1.count + nums2.count
    let medianIndex:[Int] = allCount%2 == 0 ? [allCount/2-1,allCount/2] : [allCount/2]
    var mergeArray:[Int] = []
    
    
    while point1 < nums1.count || point2 < nums2.count {
        if point1 == nums1.count {
            mergeArray.append(contentsOf: nums2[point2..<nums2.count])
            break
        }
        
        if point2 == nums2.count {
            mergeArray.append(contentsOf: nums1[point1..<nums1.count])
            break
        }
        
        mergeArray.append(min(nums1[point1],nums2[point2]))
        
        if nums1[point1] < nums2[point2] {
            point1 += 1
        }else {
            point2 += 1
        }
    }

    return medianIndex.map{Double(mergeArray[$0])}.reduce(0,+)/Double(medianIndex.count)
}


print(findMedianSortedArrays([1,3,5], [2,4,8]))
