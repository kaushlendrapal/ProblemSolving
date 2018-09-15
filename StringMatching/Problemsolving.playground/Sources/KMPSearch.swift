import Foundation

public struct KMPSearchAlgorithm {
    
    public init() {
        
    }
    
    public func buildLargeSufixPrefixArray(pattern:String) -> [Int] {
        let patternCount = pattern.count
        guard patternCount > 0 else {
            return [0]
        }
        let charPattern = Array(pattern.unicodeScalars)
        var lsp:[Int] = Array(repeating:0, count:patternCount)
        var currentIndex = 1
        var prefix = 0
        
        while currentIndex < patternCount {
            if charPattern[currentIndex] == charPattern[prefix] {
                lsp[currentIndex] = lsp[prefix] + 1
                prefix = prefix + 1
            }
            currentIndex = currentIndex + 1
        }
        
        return lsp
    }
    
    public func search(pattern:String, in text:String) -> Int {
        var indexFound:Int = 0
        let lsp = self.buildLargeSufixPrefixArray(pattern: pattern)
        var currentIndex = 0
        var currentPatternIndex = 0
        let textCharectors = Array(text.unicodeScalars)
        let charPattern = Array(pattern.unicodeScalars)
        
        while currentIndex < text.count {
            if textCharectors[currentIndex] == charPattern[currentPatternIndex] {
                currentIndex = currentIndex + 1
                currentPatternIndex = currentPatternIndex + 1
                if currentPatternIndex == charPattern.count {
                    print("patern found at index : \(currentIndex - currentPatternIndex)")
                    currentPatternIndex = lsp[currentPatternIndex - 1]
                    indexFound = currentIndex - currentPatternIndex
                }
            } else {
                if currentPatternIndex != 0 {
                    currentPatternIndex = lsp[currentPatternIndex - 1]
                }
                currentIndex = currentIndex + 1
            }            
        }
        return indexFound
    }
    
}
