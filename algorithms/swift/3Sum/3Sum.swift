//
//  3Sum.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation
/*
 Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.
 
 Note: The solution set must not contain duplicate triplets.
 
 For example, given array S = [-1, 0, 1, 2, -1, -4],
 
 A solution set is:
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
 
 https://leetcode.com/problems/3sum/
 */




func threeSum(_ nums: [Int]) -> [[Int]] {

    guard nums.count > 3 else { return [] }

    let sortedNums = nums.sorted()
    var result = [[Int]]()
    let count = sortedNums.count
    for i in 0 ..< count - 2 {

        if i == 0 || (i > 0 && sortedNums[i] != sortedNums[i-1]) {
            var lo = i+1, hi = count-1, sum = 0 - sortedNums[i]
            while lo < hi {
                if sortedNums[lo] + sortedNums[hi] == sum {
                    result.append([sortedNums[i], sortedNums[lo], sortedNums[hi]])
                    while lo < hi && sortedNums[lo] == sortedNums[lo+1] {
                        lo = lo + 1
                    }
                    while lo < hi && sortedNums[hi] == sortedNums[hi-1] {
                        hi = hi - 1
                    }
                    lo = lo + 1
                    hi = hi - 1
                } else if sortedNums[lo] + sortedNums[hi] < sum {
                    lo = lo + 1
                } else {
                    hi = hi - 1
                }
            }
        }
    }
    return result
}
