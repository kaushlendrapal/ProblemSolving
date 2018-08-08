import Foundation

#if swift(>=4.0)
print("Hello, Swift 4!")
#endif

func insertionSort<T: Comparable>(array a:inout [T]) -> [T] {
    //TODO: check for zero count.
    guard a.count > 1 else {
        return a
    }
    
    //TODO: iterate loop
    for index in 1..<a.count {
        var insertionIndex = index
        
        let insertionItem = a[index]
        
        while insertionIndex > 0 && insertionItem < a[insertionIndex - 1] {
            
            a[insertionIndex] = a[insertionIndex - 1]
            insertionIndex -= 1
        }
        //TODO: insertion swaping on unsorterd
        a[insertionIndex] = insertionItem
    }
    
    return a
}


var list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, 26 ]

print(insertionSort(array: &list))
