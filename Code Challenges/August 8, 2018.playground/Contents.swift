//: Playground - noun: a place where people can play

import Cocoa

func reverseCase(word: String) {
    
    var characters = ["h", "e", "l", "l", "o"]
    
    let index = characters.count % 2 == 0
    
    if index {
        characters = [word.uppercased()]
    }
}

print(reverseCase(word: "hello"))
