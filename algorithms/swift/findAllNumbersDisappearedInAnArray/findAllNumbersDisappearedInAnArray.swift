/*
 448. Find All Numbers Disappeared in an Array

 Given an array of integers where 1 ≤ a[i] ≤ n (n = size of array), some elements appear twice and others appear once.

 Find all the elements of [1, n] inclusive that do not appear in this array.

 Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.

 Example:

 Input:
 [4,3,2,7,8,2,3,1]

 Output:
 [5,6]


 */
func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
    guard nums.count > 0 else { return [] }
    var result = [Int]()
    let numsSet = Set(nums)

    for i in 1...nums.count {
        if !numsSet.contains(i) {
            result.append(i)
        }
    }

    return result
}
