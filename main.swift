func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    var answer = Set<[Int]>()
    answer.insert([])
    let sorted = nums.sorted()
    
    for i in 0..<nums.count {
        dfs(i,[],sorted,&answer)
    }
    return  Array(answer)
}

func dfs(_ level: Int, _ prev: [Int], _ nums: [Int], _ answer: inout Set<[Int]> ) {
  if level == nums.count {
    return
  }

  let current = prev + [nums[level]]
  answer.insert(current)

  for l in level+1..<nums.count {
    dfs(l,current,nums,&answer)
  }
}
