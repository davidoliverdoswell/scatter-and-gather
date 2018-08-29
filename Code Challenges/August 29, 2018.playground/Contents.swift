//: Playground - noun: a place where people can play

import Cocoa

func largestDifference(ints: [Int]) -> Int {
    
    guard let largest = ints.max() else { return 0 }
    guard let smallest = ints.min() else { return 0 }
    
    let int = largest - smallest
    
    for int in ints {
        largest - smallest == int
    }
    
    return int
}

print(largestDifference(ints: [9, 24, 6, 10, 43, 30]))
print(largestDifference(ints: [3, 44, 10, 11, 34, 75]))
print(largestDifference(ints: [44, 22, 10, 56, 74, 90]))
