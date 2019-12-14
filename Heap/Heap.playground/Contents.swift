import UIKit


// MARK :- MAX Heap

struct Heap {
    
    var storage:[Int] = []
    
    // MARK :- Utility Methods
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    func getLeftChildIndex(of parentIndex: Int) -> Int {
        return (2 * parentIndex + 1)
    }
    
    func getRightChildIndex(of parentIndex: Int) -> Int {
        return (2 * parentIndex + 2)
    }
    
    func getLeftChild(of parentIndex: Int) -> Int {
        return storage[getLeftChildIndex(of: parentIndex)]
    }
    
    func getRightChild(of parentIndex: Int) -> Int {
        return storage[getRightChildIndex(of: parentIndex)]
    }
    
    func getParent(of index:Int) -> Int {
        return storage[parentIndex(of: index)]
    }
    
    func hasLeftchild(of parentInxed: Int) -> Bool {
       return storage.count < getLeftChildIndex(of: parentInxed)
    }
    
    func hasRightchild(of parentInxed: Int) -> Bool {
       return storage.count < getRightChildIndex(of: parentInxed)
    }
    
    func hasParent(of index: Int) -> Bool {
        return ((index - 1) / 2) >= 0
    }
    
    mutating func swipeStorageItem(fromIndex: Int, toIndex: Int) {
        guard fromIndex < storage.count, toIndex < storage.count else { return }
        
        let tempItem = storage[toIndex]
        storage[toIndex] = storage[fromIndex]
        storage[fromIndex] = tempItem
        
    }
    
    // MARK :- CURD
    
    mutating func addItemToHeap(item: Int)  {
        storage.append(item)
        heapifyUp()
    }
    
    mutating func removeItemFromHeap() {
         guard storage.count > 0 else { return }
        let heapSize = storage.count
        print(heapSize)
        storage[0] = storage[heapSize - 1]
        storage.remove(at: heapSize - 1)
        heapifyDown()
    }
    
    // MARK :- Heapify
    
    mutating func heapifyUp() {
        guard storage.count > 0 else { return }
        let heapSize = storage.count
        var currentIndex = heapSize - 1
        
        while hasParent(of: currentIndex) && getParent(of: currentIndex) < storage[currentIndex] {
            swipeStorageItem(fromIndex: currentIndex, toIndex: parentIndex(of: currentIndex))
            currentIndex = parentIndex(of: currentIndex)
            debugPrint( "heapifyUp \(currentIndex)")
        }
        
    }
    
    mutating func heapifyDown() {
         guard storage.count > 0 else { return }
        var currentIndex = 0
        let heapSize = storage.count
        
        while hasLeftchild(of: currentIndex) {
            var maxChildValue = getLeftChild(of: currentIndex)
            var maxChildIndex = getLeftChildIndex(of: currentIndex)
            if maxChildValue < getRightChild(of: currentIndex) {
                maxChildValue = getRightChild(of: currentIndex)
                maxChildIndex = getRightChildIndex(of: currentIndex)
            }
            
            if maxChildValue < storage[currentIndex] {
                break
            } else {
                swipeStorageItem(fromIndex: maxChildIndex, toIndex: currentIndex)
                currentIndex = maxChildIndex
            }
            debugPrint(" heapifyDown  \(currentIndex)")
        }
        
    }
    
    func heapSort()  {
        
    }
    
}

// MARK :-  MAX Heap example

var heap = Heap()
 heap.addItemToHeap(item: 5)
heap.addItemToHeap(item: 13)
heap.addItemToHeap(item: 27)
heap.addItemToHeap(item: 5)
heap.addItemToHeap(item: 20)
heap.addItemToHeap(item: 100)






