def maxProduct(self, nums):
    if nums is None: return 0

    res, curMax, curMin = nums[0], nums[0], nums[0]

    for i in range(1, len(nums)):
        num = nums[i]
        curMax, curMin = curMax * num, curMin * num
        curMin, curMax = min(curMax, curMin, num), max(curMax, curMin, num)
        res = curMax if curMax > res else res
    return res
