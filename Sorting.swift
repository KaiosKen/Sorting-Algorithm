import Foundation
import Swift
// Determine the file name

var randomWords : [String]?

// Read the contents of the specified file
do {
    //This do-catch program puts a txt file into an array and seperates it into multiple values 
    let data = try String(contentsOfFile:"random.txt", encoding: String.Encoding.utf8)
    randomWords = data.components(separatedBy: "\n")
    randomWords?.removeLast()
    print(randomWords![0])
    
} catch let err as NSError {
    // do something with Error
    print(err)
    
}
var sequence = 0 
var wordCount = randomWords!.count - 1 //Gives the amount of different words in the variable. subtract by 1 because arrays start counting from 0
func Sorter(words : Array<String>, arrayCount: Int, wordCount: Int) -> Array<String> { //Function that sorts. 
    var sortedWords = words // Have to create a new variable because anything inputted into a function becomes a let instead of a var
    var sequence2 = 0 // sequence2 will always access the array in front of sequence so it can compare the two
    func checkSorted(words: Array<String>) -> Bool // This function will check if the Sorter is finished sorting
    {
        
        var orderCheck = 0 // This variable will keep track of how many times each set of array values are in the right order
        for x in 0...(wordCount-1) {
            if words[x] != nil && words[x+1] != nil {
                if words[x] < words[x+1] {
                    orderCheck += 1
                }
            }
        }
        if orderCheck >= wordCount-2
        {
            print("True")
            return true
        } else {
            
            return false
        }
        
    }
    while true {
        sequence2 = sequence + 1
        
        if sortedWords[sequence] > sortedWords[sequence2]
        {
            sortedWords.swapAt(sequence, sequence2)
        }
        if sequence >= wordCount-1 {
            sequence = 0
            sequence2 = 0
            // print("finished a loop")
            if checkSorted(words:sortedWords)
        {
            break
        }
        } else {
            sequence += 1
            
        }
        
        /* var word1 : UInt8 = 1
        
        word1 = (sortedWords[sequence].first!).asciiValue!
        
        if word1 < 97 && word1 > 64 {
            word1 += 32 // This If-Statement checks if the asciiValue is uppercase and adjusts accordingly
            }
        var word2 : UInt8 = 1
        
        word2 = (sortedWords[(sequence2)].first!).asciiValue!
        
        if word2 < 97 && word2 > 64 {
            word2 += 32
        }
        if word1 > word2 { // The greater an asciivalue is, the further up the alphabet it is. So we use this to check if the word on the left is lower than the one on the right.
            sortedWords.swapAt(sequence, sequence2)
            sequence += 1
        } else {
            sequence += 1
        }
        if sequence == wordCount{
            sequence = 0   
            sequence2 = 0
            print(sortedWords)
           
        } */
      
        
    }
    return sortedWords
}
print(Sorter(words: randomWords!, arrayCount:sequence, wordCount:wordCount))  
//WordtoNumber(randomWords[sequence]: word
  
