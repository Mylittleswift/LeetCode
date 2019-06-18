/*
 Given a string, sort it in decreasing order based on the frequency of characters.

 Example 1:

 Input:
 "tree"

 Output:
 "eert"

 Explanation:
 'e' appears twice while 'r' and 't' both appear once.
 So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.

 Example 2:

 Input:
 "cccaaa"

 Output:
 "cccaaa"

 Explanation:
 Both 'c' and 'a' appear three times, so "aaaccc" is also a valid answer.
 Note that "cacaca" is incorrect, as the same characters must be together.

 Example 3:

 Input:
 "Aabb"

 Output:
 "bbAa"

 Explanation:
 "bbaA" is also a valid answer, but "Aabb" is incorrect.
 Note that 'A' and 'a' are treated as two different characters.

 */

func frequencySort(_ s: String) -> String {
    guard !s.isEmpty else { return s }
    let chars = Array(s)
    var dic = [Character:Int]()
    for c in chars {
        if let count = dic[c] {
            dic[c] = count + 1
        } else {
            dic[c] = 1
        }
    }

    let sort = dic.sorted{ $0.value > $1.value }
    var result = ""
    for (key,value) in sort {
        for _ in 0..<value {
            result.append(key)
        }
    }

    return result
}
