import Foundation

var arrayOfStrings: [String]?

do {
    // This solution assumes  you've got the file in your bundle
    let data = try String(contentsOfFile:"random.txt", encoding: String.Encoding.utf8)
        arrayOfStrings = data.components(separatedBy: "\n")
        print(arrayOfStrings!)
        print("Works!")
    
} catch let err as NSError {
    // do something with Error
    print(err)
    print("Doesn't Work!")
}
print("Done")
