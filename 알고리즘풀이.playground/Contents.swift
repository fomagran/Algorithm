func solution(_ numbers:[Int]) -> Int {
    return 45 - numbers.reduce(0){$0 + $1}
}
