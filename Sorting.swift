import Foundation

var randomWords : [String] = []

// Read the contents of the specified file
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
func merge(left:[String],right:[String]) -> [String] {
    var mergedList = [String]()
    var left = left
    var right = right

    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergedList.append(left.removeFirst())
        } else {
            mergedList.append(right.removeFirst())
        }
    }

    return mergedList + left + right
}

func mergeSort(list:[String]) -> [String] {
    guard list.count > 1 else {
        return list
    }

    let leftList = Array(list[0..<list.count/2])
    let rightList = Array(list[list.count/2..<list.count])

    return merge(left: mergeSort(list:leftList), right: mergeSort(list:rightList))
}
var list = [String]()

for x in 0...randomWords.count-1 {
    list.append(randomWords[x])
}

print(list)

print(mergeSort(list: list))
