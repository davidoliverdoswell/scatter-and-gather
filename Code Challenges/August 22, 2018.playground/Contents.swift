//: Playground - noun: a place where people can play

import Cocoa

/*
 An Armstrong number is an n-digit number that is equal to the sum of the n'th powers of its digits. Determine if the input number is an Armstrong number.  Return either true or false .
 
 For example with the number 153 there are 3 digits so you would add together the cubed values of all the digits like this: 1^3 + 5^3 + 3^3 === 153
 */

func isArmstrongNumber(inputNumber: Int) -> Bool {
    
    let a = 1
    let b = 2
    let c = 3
    
    let aValue = a * 1 * 1
    let bValue = b * 2 * 2
    let cValue = c * 3 * 3
    
    let n = (aValue, bValue, cValue)
    
    
    return true
}

print(isArmstrongNumber(inputNumber: 123))

