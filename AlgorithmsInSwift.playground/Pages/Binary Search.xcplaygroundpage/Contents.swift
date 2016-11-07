func binarySearch(array: [Int], key: Int) -> Int {
    var lo = 0
    var hi = array.count - 1;
    while (lo <= hi) {
        let mid = lo + (hi - lo) / 2;
        if key < array[mid] {
            hi = mid - 1
        } else if key > array[mid] {
            lo = mid + 1
        } else {
            return mid;
        }
    }
    return -1; //not find
}

let a = [1,2,3,4,5,6,7,8,9,22,46,67,223,6756,2346]
binarySearch(array: a, key: 8)
