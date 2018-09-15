//: Playground - noun: a place where people can play

import UIKit

#if swift(>=4.0)
print("Hello, Swift 4!")
#endif

let kmpSearch: KMPSearchAlgorithm = KMPSearchAlgorithm()
//let lsp = kmpSearch.buildLargeSufixPrefixArray(pattern: "aabbaa")
//print("final lsp pattern is: \(lsp)")
let text = "abdgaabbaasbsdkjsdgjhsdgfaabbaahjshdg"
let rangeFound = kmpSearch.search(pattern: "aabbaa", in: text)
