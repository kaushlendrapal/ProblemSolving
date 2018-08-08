//: Playground - noun: a place where people can play

import Foundation

let a = [32,65,4,3,1,2,3,4,20,6,7,8,9,10,11,56,1,3,14,15,34,4,5,6,7,8,9]
print(a)

let result = findLargestConcurrentIncreasingNumber(a)
print(result)


public func quickSort<T: Comparable>(_ a:[T]) -> ([T]) {
    
    guard a.count > 1 else {
        return a
    }
    
    let totalCount = a.count
    let piovatal = a[a.count/2]
    
    let grater = a.filter { (included) -> Bool in included > piovatal  }
    let equal = a.filter { (included) -> Bool in included == piovatal  }
    let lesser = a.filter { (included) -> Bool in included < piovatal  }
    
    return quickSort(lesser) + equal + quickSort(grater)
}


let b = [32,65,4,3,1,2,3,4,20,6,7,8,9,10,11,56,1,3,14,15,34,4,5,6,7,8,9]
print(a)

let sorted = quickSort(b)
print(sorted)
