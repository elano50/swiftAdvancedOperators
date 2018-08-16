//: Playground - noun: a place where people can play

import UIKit


// NOT operator

let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits   // equals 11110000

let notResult = String(repeating: Character("0"), count: (8 - String(invertedBits, radix: 2).count)) + String(invertedBits, radix: 2)

// AND operator

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits  // equals 00111100

let andResult = String(repeating: Character("0"), count: (8 - String(middleFourBits, radix: 2).count)) + String(middleFourBits, radix: 2)

// OR operator

let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // equals 11111110

let orResult = String(repeating: Character("0"), count: (8 - String(combinedbits, radix: 2).count)) + String(combinedbits, radix: 2)

// XOR operator

let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits  // equals 00010001

let xorResult = String(repeating: Character("0"), count: (8 - String(outputBits, radix: 2).count)) + String(outputBits, radix: 2)

// Shift

let shiftBits: UInt8 = 4   // 00000100 in binary
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 00000001

let pink: UInt32 = 0xCC6699 // 0x0000CC
let redComponent = (pink & 0xFF0000) >> 16    // redComponent is 0xCC, or 204
let greenComponent = (pink & 0x00FF00) >> 8   // greenComponent is 0x66, or 102
let blueComponent = pink & 0x0000FF           // blueComponent is 0x99, or 153

// Value overflow

var unsignedOverflow = UInt8.max
// unsignedOverflow equals 255, which is the maximum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &+ 1
// unsignedOverflow is now equal to 0

var unsignedMinOverflow = UInt8.min
// unsignedOverflow equals 0, which is the minimum value a UInt8 can hold
unsignedMinOverflow = unsignedMinOverflow &- 1
// unsignedOverflow is now equal to 255

var signedOverflow = Int8.min
// signedOverflow equals -128, which is the minimum value an Int8 can hold
signedOverflow = signedOverflow &- 1
// signedOverflow is now equal to 127

2 + 3 % 4 * 5


// Operator Methods

struct Vector2D {
  var x = 0.0, y = 0.0
}

extension Vector2D {
  static func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
  }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
// combinedVector is a Vector2D instance with values of (5.0, 5.0)

extension Vector2D {
  static prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
  }
  
  static prefix func ++ (vector: Vector2D) -> Vector2D {
    return Vector2D(x: vector.x + 1, y: vector.y + 1)
  }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
// negative is a Vector2D instance with values of (-3.0, -4.0)
let alsoPositive = -negative
// alsoPositive is a Vector2D instance with values of (3.0, 4.0)
let incremented = ++alsoPositive

extension Vector2D {
  static func += (left: inout Vector2D, right: Vector2D) {
    left = left + right
  }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
// original now has values of (4.0, 6.0)

extension Vector2D: Equatable {
  static func == (left: Vector2D, right: Vector2D) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
  }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
twoThree == anotherTwoThree
twoThree != anotherTwoThree

prefix operator +++

extension Vector2D {
  static prefix func +++ (vector: inout Vector2D) -> Vector2D {
    vector += vector
    return vector
  }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled


infix operator +-: AdditionPrecedence
extension Vector2D {
  static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
  }
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector is a Vector2D instance with values of (4.0, -2.0)

