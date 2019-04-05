//
//  reverseString.swift
//  
//
//  Created by Dong, Anyuan (133) on 2019/4/5.
//

import Foundation
/*
 Write a function that reverses a string. The input string is given as an array of characters char[].
 
 Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.
 
 You may assume all the characters consist of printable ascii characters.
 
 https://leetcode.com/problems/reverse-string/
 */

//func reverseString(_ s: String) -> String {
//    guard s.count > 0 else { return "" }
//    var strArray = Array(s)
//    var start = 0
//    var end = strArray.count - 1
//    while (start < end) {
//        let temp = strArray[start]
//        strArray[start] = strArray[end]
//        strArray[end] = temp
//
//        start = start + 1
//        end = end - 1
//    }
//    return String(strArray)
//}

func reverseString(_ s: String) -> String {
    var startIndex = 0
    var endIndex = s.count-1
    var array = s.cString(using:.utf8)!
    while startIndex < endIndex {
        let char = array[startIndex]
        array[startIndex] = array[endIndex]
        array[endIndex] = char
        startIndex += 1
        endIndex -= 1
    }
    return String.init(utf8String: array)!
}
