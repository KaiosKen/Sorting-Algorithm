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
print(randomWords.sorted())
