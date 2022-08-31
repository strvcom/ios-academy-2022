//: # Enums

import Foundation

//: ### Simple enum

/// Has raw value of Int
enum SimpleEnum: Int {
    case one // 0 raw value
    case two
    case four = 4
}

let simpleEnumValue: SimpleEnum = .one

print(simpleEnumValue)

print("Int value of SimpleEnum.simpleFour.rawValue is \(SimpleEnum.four.rawValue)")

if simpleEnumValue == .one {
    print("hey Im successful")
}

if simpleEnumValue.rawValue == 0 {
    print("hey Im successful")
}

// Doesn't have rawValue
enum MySimpleEnum {
    case myOne
    case myTwo
}

let mySimpleEnumValue: MySimpleEnum = .myOne

print(mySimpleEnumValue)

if mySimpleEnumValue == .myOne {
    print("YES I'm the mySimpleCaseOne value")
}

//:  ### Enums with associated value

protocol SomeProtocol {}

enum EnumWithValue {
    case text(String)
    case number(Int)
    case labeled(label: String) // labeled
    case notEquatable(SomeProtocol) // unknown type
}

let myEnumWithValue: EnumWithValue = .labeled(label: "iOS academy")

// Bad
// myEnumWithValue == .labeled(let label)

// full switch shortcut
// similar for guard
// https://fuckingifcaseletsyntax.com

if case let .labeled(label) = myEnumWithValue {
    print("success \(label)")
}

//:  ### Comparing enums
// in case associated value is also Equatable no need of custom == method
extension EnumWithValue: Equatable {
    static func == (lhs: EnumWithValue, rhs: EnumWithValue) -> Bool {
        switch (lhs, rhs) {
        case (.notEquatable(_), .notEquatable(_)):
            return false
        default: return true
        }
    }
}

let mySecondEnumWithValue: EnumWithValue = .labeled(label: "iOS academy")

print(mySecondEnumWithValue == myEnumWithValue)

//:  ### Loop over array of enums with associated value

let enumsWithValue: [EnumWithValue] = [.number(Int.random(in: 1...10)), .number(Int.random(in: 1...10)), .number(Int.random(in: 1...10)), .number(Int.random(in: 1...10))]

// for-in loop 🎉
for case let .number(numberValue) in enumsWithValue where numberValue > 5 {
    print(numberValue)
}

//: [Next](@next)

