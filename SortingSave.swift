import Foundation
var randomWords : [String] = []
do {
    //This do-catch program puts a txt file into an array and seperates it into multiple values
    let data = try String(contentsOfFile:"random.txt", encoding: String.Encoding.utf8)
    randomWords = data.components(separatedBy: "\n")
    randomWords.removeLast()
    print(randomWords[0])

} catch let err as NSError {
    // do something with Error
    print(err)

}

struct MinHeap
{
    var items: [String] = []
    // ---------------------------------------------------------Gets the Index
    private func getLeftChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 1
    }
    private func getRightChildIndex(_ parentIndex: Int) -> Int {
        return 2 * parentIndex + 2
    }
    private func getParentIndex(_ childIndex: Int) -> Int {
        return (childIndex-1)/2
    }
    // ----------------------------------------------Boolean Check

    private func hasLeftChild(_ index:Int) -> Bool {
        return getLeftChildIndex(index) < items.count
    }
    private func hasRightChild(_ index:Int) -> Bool {
        return getRightChildIndex(index) < items.count
    }
    private func hasParent(_ index: Int) -> Bool {
        return getParentIndex(index) >= 0        
  }
    // ---------------------------------------------- Return Item From Heap
    private func leftChild(_ index: Int) -> String {
        return items[getLeftChildIndex(index)]
    }
    private func rightChild(_ index: Int) -> String {
        return items[getRightChildIndex(index)]
    }
    private func parent(_ index: Int) -> String {
        return items[getParentIndex(index)]
    }
    public func peek() -> String {
        if items.count != 0 {
            return items[0]
        } else {
            fatalError()
        }
    }
    mutating public func poll() -> String {
        if items.count != 0 {
            let item = items[0]
            items[0] = items[items.count - 1]
            heapifyDown()
            items.last
            return item
        } else {
            fatalError()
        }
    }
    mutating public func add(_ item: String) {
        items.append(item)
        heapifyUp()
    }
    mutating private func swap(indexOne: Int, indexTwo: Int) {
        let placeholder = items[indexOne]
        items[indexOne] = items[indexTwo]
        items[indexTwo] = placeholder
    } 
    mutating private func heapifyUp() {
        var index = items.count - 1
        while hasParent(index) && parent(index) > items[index] {
            swap(indexOne: getParentIndex(index), indexTwo: index)
            index = getParentIndex(index)
        }
    }
    mutating private func heapifyDown() {
        var index = 0
        while hasLeftChild(index) {
            var smallerChildIndex = getLeftChildIndex(index)
            if hasRightChild(index) && rightChild(index) < leftChild(index) {
                smallerChildIndex = getRightChildIndex(index)
            }

            if items[index] < items[smallerChildIndex] {
                break
            } else {
                swap(indexOne: index, indexTwo: smallerChildIndex)
            }
            index = smallerChildIndex
        }
    }
}

var myHeap = MinHeap()
for x in 0...randomWords.count-1 {
    myHeap.add(randomWords[x])
} 
/*
myHeap.add(9)
myHeap.add(7)
myHeap.add(3)
myHeap.add(4) */

dump(myHeap.items)
