import Foundation

var randomWords : Array<String>
randomWords = ["Pink", "Burger", "Yeti", "Xylophone", "Apple", "Oreo", "England"]
var sequence = 0
var wordCount = randomWords.count
func Sorter(words : Array<String>, sequence: Int, wordCount: Int) {
    for sequence in 0...wordCount {
        var word1 : UInt8 = 1
        word1 = (words[sequence].first!).asciiValue!
        print(word1)
        if word1 != 1 {
            print("Success")
        }
    }
   

}
Sorter(words: randomWords, sequence:sequence, wordCount:wordCount)  
//WordtoNumber(randomWords[sequence]: word
