func find132pattern(_ nums: [Int]) -> Bool {

    var stack = [(Int, Int)]()

    for i in 0..<nums.count {
        if stack.isEmpty || nums[i] < stack.last!.0 {
            stack.append((nums[i], nums[i]))
        } else {
            let currentMin = stack.last!.0
            while !stack.isEmpty && nums[i] >= stack.last!.1 {
                stack.removeLast()
            }
            if !stack.isEmpty && nums[i] > stack.last!.0
                 && nums[i] < stack.last!.1 {
                return true
            }
            stack.append((currentMin, nums[i]))
        }
    }
    return false
}
