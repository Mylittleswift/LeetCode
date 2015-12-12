//: [Previous](@previous)

import Foundation


public class Sort<T:Comparable>
{
    //uses ~ N2 / 2 compares and N exchanges to sort an array of length N.
    public class func selectionSort(inout array: [T])
    {
        let count = array.count
        
        for var i=0; i < count; i++ {
            var min = i
            for var j=i+1; j < count; j++ {
                if array[j] < array[min] {
                    min = j
                }
            }
            exchange(&array, i, min)
        }
    }
    
    //Best case. If the array is in ascending order, insertion sort makes N-1 compares and 0 exchanges.
    //Worst case. If the array is in descending order (and no duplicates), insertion sort makes ~1/2 N2 compares and ~1/2 N2 exchanges.
    public class func insertionSort(inout array: [T])
    {
        let count = array.count
        
        for var i = 0; i < count; i++ {
            for var j = i; j > 0; j-- {
                if array[j] < array[j-1] {
                    exchange(&array, j, j-1)
                }
                else {
                    break
                }
            }
        }
    }
    
    
    //The worst-case number of compares used by shellsort with the 3x+1 increments is O(N3/2).
    //Useful in practice.
    //* fast unless array size is huge.
    //* Tiny, fixed footprint for code (used in embedded systems).
    //* Hardware sort prototype.
    public class func shellSort(inout array: [T])
    {
        let count = array.count
        
        var h = 1
        while (h < count/3) {
            h = 3*h + 1
        }
        
        while (h >= 1) {
            //h-sort the array.
            for var i = h; i < count; i++ {
                for var j = i; (j >= h && array[j] < array[j - h]); j -= h {
                    exchange(&array, j, j - h)
                }
            }
            h = h/3;
        }
    }
    
    private class func exchange<T:Comparable>(inout array: [T], _ i: Int, _ j: Int)
    {
        let temp = array[j]
        array[j] = array[i]
        array[i] = temp
    }
}


//convex hull
struct Point2D {
    let x,y: Double
    
    //判断3点是否成顺时针，逆时针，共线角度
    static func ccw (a: Point2D, b: Point2D, c: Point2D) -> Int {
        let area2 = (b.x - a.x) * (c.y - a.y) - (b.y - a.y) * (c.x - a.x)
        if area2 > 0 {
            return -1
        }
        else if area2 > 0 {
            return +1;
        }
        else {
            return 0;
        }
    }
}

//selectionSort
var arrayOfInt = [3,2,6,9]
var arrayOfString = ["abc", "zfg", "leg", "bee"]

var test_selectionSortInt = arrayOfInt
Sort.selectionSort(&test_selectionSortInt)
test_selectionSortInt

var test_selectionSortString = arrayOfString
Sort.selectionSort(&test_selectionSortString)
test_selectionSortString

//insertionSort
var test_insertionSortInt = arrayOfInt
Sort.insertionSort(&test_insertionSortInt)
test_insertionSortInt

var test_insertionSortString = arrayOfString
Sort.insertionSort(&test_insertionSortString)
test_insertionSortString

//Shellsort
var arrayOfString_ss = ["s","o","r","t","e","x","a","m","p","l","e"]
Sort.shellSort(&arrayOfString_ss)
arrayOfString_ss

let a = Point2D(x: 1, y: 2)





public class MergeSort<T: Comparable> {
    
    private class func merge (inout a:[T], inout aux:[T], lo: Int, mid:Int, hi: Int) {
        var i = lo, j = mid+1
        
        for var k = lo; k <= hi; k++ {
            aux[k] = a[k]
        }
        
        for var k = lo; k <= hi; k++ {
            if i > mid {
                a[k] = aux[j++]
            } else if j > hi {
                a[k] = aux[i++]
            } else if aux[j] < aux[i] {
                a[k] = aux[j++]
            } else {
                a[k] = aux[i++]
            }
        }
    }
    
    private class func sort (inout a:[T], inout aux:[T], lo: Int, hi: Int) {
        if hi <= lo {
            return
        }
        let mid = lo + (hi - lo) / 2
        sort(&a, aux: &aux, lo: lo, hi: mid)
        sort(&a, aux: &aux, lo: mid+1, hi: hi)
        
        //already sorted, so return
        if !(a[mid+1] < a[mid]) {
            return
        }
        merge(&a, aux: &aux, lo: lo, mid: mid, hi: hi)
    }
    
    public class func sort (inout a:[T]) {
        var aux = [T]()
        aux.appendContentsOf(a)
        sort(&a, aux: &aux, lo: 0, hi: a.count - 1)
    }
    
    //bottom-up mergesort, no recursive
    public class func sortBU (inout a:[T]) {
        let N = a.count
        var aux = [T]()
        aux.appendContentsOf(a)
        for var sz = 1; sz < N; sz = sz + sz {
            for var lo = 0; lo < N - sz; lo += sz + sz {
                merge(&a, aux: &aux, lo: lo, mid: lo+sz-1, hi: min(lo+sz+sz-1, N-1))
            }
        }
    }
    
}


var arrayOfInt_mergeSort = [3,5,7,1,0,100,234,156,31]
MergeSort.sortBU(&arrayOfInt_mergeSort)
arrayOfInt_mergeSort

var arrayOfString_mergeSort = ["s","o","r","t","e","x","a","m","p","l","e"]
MergeSort.sort(&arrayOfString_mergeSort)
arrayOfString_mergeSort


//Quick Sort

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

public class QuickSort<T: Comparable> {
    public class func sort(inout array: [T]) {
        //shuffling is needed for performance guarantee.
        array.shuffle()
        sort(&array, low: 0, high: array.count - 1)
        
    }
    
    private class func ThreeWaySort(inout a:[T], low: Int, high: Int) {
        guard high > low else {
            return
        }
        
        var lt = low, i = low + 1, gt = high
        let v = a[low]
        while i <= gt {
            if a[i] < v {
                exchange(&a, lt++, i++)
            } else {
                i++
            }
        }
        sort(&a, low: low, high: lt - 1)
        sort(&a, low:gt + 1, high: high)
    }
    
    
    private class func sort(inout a:[T], low: Int, high: Int) {
        
        guard high > low else {
            return
        }
        let j = partition(&a, low: low, high: high)
        sort(&a, low:low, high:j - 1)
        sort(&a, low:j+1, high:high)
    
    }
    
    private class func partition(inout a:[T], low:Int, high: Int) -> Int{
        var i = low, j = high + 1
        while true {
            while (a[++i] < a[low]) {
                if i == high {
                    break
                }
            }
            
            while (a[low] < a[--j]) {
                if j == low {
                    break
                }
            }
            
            if i >= j {
                break
            }
            exchange(&a, i, j)
        }
        exchange(&a, low, j)
        return j
    }
    
    private class func exchange<T:Comparable>(inout array: [T], _ i: Int, _ j: Int)
    {
        let temp = array[j]
        array[j] = array[i]
        array[i] = temp
    }
}



var arrayOfInt_quickSort = [3,5,7,1,0,100,234,156,31]
QuickSort.sort(&arrayOfInt_quickSort)
arrayOfInt_quickSort

var arrayOfString_quickSort = ["s","o","r","t","e","x","a","m","p","l","e"]
QuickSort.sort(&arrayOfString_quickSort)
arrayOfString_quickSort



//sorts a[1] to a[N]
//heapsort NLogN in place sort, not stable
final public class HeapSort<T: Comparable> {
    public final class func sort(inout a:[T]) {
        
        var N = a.count
        //heap construction
        for (var k = N/2; k>=1; k--) {
            sink(&a, k: k, len: N)
        }
        while N > 1 {
            exchange(&a, 1, N--)
            sink(&a, k: 1, len: N)
        }
    }
    
    private class final func sink(inout a:[T], var k: Int, len: Int) {
        
        while (2*k <= len) {
            var j = 2*k
            if (j < len && less(a, j, j+1)) {
                j++
            }
            if (!less(a, k, j)) {
                break
            }
            exchange(&a, k, j)
            k = j
        }
    }
    
    private class final func less(a: [T], _ i: Int, _ j: Int) -> Bool {
        return a[i-1] < a[j-1]
    }
    
    private class final func exchange<T:Comparable>(inout array: [T], _ i: Int, _ j: Int)
    {
        let temp = array[j-1]
        array[j-1] = array[i-1]
        array[i-1] = temp
    }
}

var arrayOfString_HeapSort = ["","s","o","r","t","e","x","a","m","p","l","e"]
HeapSort.sort(&arrayOfString_HeapSort)
arrayOfString_HeapSort


