/*
 Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position. Return the max sliding window.

 https://leetcode.com/problems/sliding-window-maximum/
 */

class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {

        guard nums.count > 1 else { return nums }
        guard k > 1 else { return nums }

        let maxHeap = MaxHeap(capacity: k)
        var result = [Int]()
        for i in 0..<k {
            maxHeap.insert(nums[i])
        }
        result.append(maxHeap.max())
        for i in 1 ..< nums.count-k+1 {
            let window = nums[i..<i+k]
            maxHeap.insert(nums[i+k-1])

            while !window.contains(maxHeap.max()) {
                maxHeap.deleteMax()
            }

            result.append(maxHeap.max())
        }
        return result
    }
}


final class MaxHeap {
    private var pq: [Int]
    private let MAX: Int

    public init(capacity: Int) {
        pq = [Int]()
        MAX = capacity + 1
        //insert fake head,
        //heap index from 1
        //so that we can calculate index easily
        pq.append(0)
    }

    public func insert(_ k: Int) {
        pq.append(k)
        swim(pq.count-1)
    }

    public func max() -> Int {
        return pq[1]
    }
    public func deleteMax() -> Int {
        let max = pq[1]
        exchange(1, pq.count-1)
        pq.removeLast()
        sink(1)
        return max
    }

    //
    private func sink(_ index: Int) {
        var index = index
        while 2 * index <= pq.count-1 {
            var j = 2 * index
            if j < pq.count-1 && pq[j] < pq[j+1] {
                j = j + 1
            }
            if !(pq[index] < pq[j]) { break }
            exchange(index, j)
            index = j
        }
    }

    private func swim(_ index: Int) {
        var index = index
        while index > 1 && pq[index/2] < pq[index] {
            exchange(index/2, index)
            index = index / 2
        }
    }

    private func exchange(_ i: Int, _ j: Int) {
        let temp = pq[i]
        pq[i] = pq[j]
        pq[j] = temp
    }
}
