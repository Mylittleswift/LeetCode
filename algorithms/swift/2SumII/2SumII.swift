//
//  2SumII.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation
/*
 
 Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
 
 Note:
 
 Your returned answers (both index1 and index2) are not zero-based.
 You may assume that each input would have exactly one solution and you may not use the same element twice.
 
 https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/
 */

func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
    
    var startIndex = 0
    var endIndex = numbers.count - 1
    
    while (numbers[startIndex] + numbers[endIndex] != target && startIndex < endIndex) {
        if numbers[startIndex] + numbers[endIndex] > target {
            endIndex -= 1
        } else {
            startIndex += 1
        }
    }
    
    return [startIndex+1, endIndex+1]
}
