//: [Previous](@previous)

import Foundation
/*
Given two binary strings, return their sum (also a binary string).

For example,
a = "11"
b = "1"
Return "100".
 
https://leetcode.com/problems/add-binary/
*/

func addBinary(_ a: String, _ b: String) -> String {
    var addOne = false
    var result = ""
    
    let lengthOfA = a.characters.count
    let lengthOfB = b.characters.count
    var max = 0
    var min = 0
    
    if lengthOfA == 0,
        lengthOfB == 0 {
        return "0"
    }
    
    //check input
    if lengthOfA > 0, lengthOfB == 0 {
        return a
    }
    
    if lengthOfB > 0, lengthOfA == 0 {
        return b
    }
    
    var first = ""
    var second = ""
    if lengthOfA >= lengthOfB {
        first = a
        second = b
        max = lengthOfA
        min = lengthOfB
        
    } else {
        first = b
        second = a
        max = lengthOfB
        min = lengthOfA
    }
    
    for _ in (0 ..< min).reversed() {
        let f = first.characters.popLast()!
        let s = second.characters.popLast()!
        //both 1
        if f == "1" && s == "1" {
            if addOne == true {
                result.append("1")
            } else {
                result.append("0")
            }
            addOne = true
        } else if f == "1" || s == "1" { //has 1
            if addOne == true {
                result.append("0")
                addOne = true
            } else {
                result.append("1")
                addOne = false
            }
        } else {//both 0
            if addOne == true {
                result.append("1")
            } else {
                result.append("0")
            }
            addOne = false
        }
    }
    
    for _ in min ..< max {
        let f = first.characters.popLast()!
        if f == "1" {
            if addOne == true {
                result.append("0")
                addOne = true
            } else {
                result.append("1")
                addOne = false
            }
        } else {
            if addOne == true {
                result.append("1")
                addOne = false
            } else {
                result.append("0")
                addOne = false
            }
        }
    }
    
    if addOne == true {
        result.append("1")
    }
    
    return String(result.characters.reversed())
}

//test cases
addBinary("1", "0")
addBinary("0", "0")
addBinary("11", "0")
addBinary("11", "1")
addBinary("1", "11")
addBinary("1", "10")
addBinary("11", "11")
addBinary("111", "1")
addBinary("111", "10")
addBinary("1010", "1011")
addBinary("110010", "10111")

