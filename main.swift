func lengthOfLastWord(_ s: String) -> Int {
    return s.components(separatedBy: " ").filter { $0.count != 0 }.last!.count
}
