//: Playground - noun: a place where people can play

import Foundation


#if swift(>=4.0)
print("Hello, Swift 4!")
#endif


let b = [32,65,4,3,1,2,3,4,20,6,7,8,9,10,11,56,1,3,14,15,34,4,5,6,7,8,9]
let sorted = quickSort(b)
print(sorted)

var list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, 26 ]
print(insertionSort(array: &list))

