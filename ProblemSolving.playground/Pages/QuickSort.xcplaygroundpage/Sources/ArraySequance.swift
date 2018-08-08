import Foundation

public func findLargestConcurrentIncreasingNumber<T: Numeric> (_ a: [T]) -> ([T]) {
    
    var inputArray = a
    var range = Range(0...0)
    var index = 1
    while index < inputArray.count {
        var  currentItem = inputArray[index]
        var currentIndex = index
        while currentIndex < (inputArray.count - 1) && (currentItem + 1) == inputArray[currentIndex + 1] {
            currentIndex += 1
            currentItem = inputArray[currentIndex]
        }
        
        if index != currentIndex && range.count < Range(index...currentIndex).count {
            range = Range(index...currentIndex)
            index = currentIndex
        } else {
            index += 1
            
        }
    }
    let result = Array(inputArray[range])
    return result
}


