//
//  plusOne.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation

/*
 Given a non-empty array of digits representing a non-negative integer, plus one to the integer.
 
 The digits are stored such that the most significant digit is at the head of the list, and each element in the array contain a single digit.
 
 You may assume the integer does not contain any leading zero, except the number 0 itself.
 
 */

//https://leetcode.com/problems/plus-one/description/


class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        
        guard !digits.isEmpty else {
            return []
        }
        
        var result = digits
        //reverse iterate
        var needsPlusOne = true
        for index in stride(from: digits.count-1, to: -1, by: -1) {
            
            if needsPlusOne {
                result[index] += 1
            }
            
            if result[index] >= 10 {
                needsPlusOne = true
                result[index] -= 10
            } else {
                needsPlusOne = false
                break
            }
        }
        
        if needsPlusOne {
            result.insert(1, at:0)
        }
        return result
    }
}
