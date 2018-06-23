//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1. Создайте расширение для Int с пропертисами isNegative, isPositive, bool
//
//2. Добавьте проперти, которое возвращает количество символов в числе
//
//3. Добавьте сабскрипт, который возвращает символ числа по индексу:
//
//let a = 8245
//
//a[1] // 4
//a[3] // 8
//
//Профи могут определить и сеттер :)
//
//4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его
//
//5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие:
//
//let s = "Hi hi hi"
//
//s.truncate(4) // Hi h...
//
//s.truncate(10) // Hi hi hi

extension Int {
    var isNegative : Bool{
        return self < 0
    }
    var isPositive : Bool{
        return self >= 0
    }
    var symbolsInNumber : Int{
        return String(self).count
    }
    subscript(_ numberOfSymbol : Int) -> Int? {
        get {
            if numberOfSymbol >= String(self).count || numberOfSymbol < 0{
                return nil
            }
            let start = String.Index(encodedOffset: numberOfSymbol)
            let end = String.Index(encodedOffset: numberOfSymbol + 1)
            let substring = String(String(String(self).reversed())[start..<end])
            
            return Int(substring)
        }
        set {
            if numberOfSymbol < String(self).count && numberOfSymbol >= 0{
                if let value = newValue{
                    switch value {
                    case 0...9 :
                        var selfString = String(self)
                        selfString = String(selfString.reversed())
                        let start = selfString.index(selfString.startIndex, offsetBy: numberOfSymbol)
                        let end = selfString.index(selfString.startIndex, offsetBy: numberOfSymbol + 1)
                        selfString.replaceSubrange(start..<end, with: String(newValue!))
                        self = Int(String(selfString.reversed()))!
                    default: self
                    }
                }
            }
        }
    }
}


var b = 100
b.isPositive
b.isNegative
b = 0
b.isPositive
b.isNegative
b = -100
b.isPositive
b.isNegative
b = 9876543210
b.symbolsInNumber

b[0]
b[5]
b[8]
b[9]
b[10]

for i in 0...50{
    b[i] = 8
}

b
//4. Расширить String, чтобы принимал сабскрипт вида s[0..<3] и мог также устанавливать значения используя его
//
//5. Добавить стрингу метод truncate, чтобы отрезал лишние символы и , если таковые были, заменял их на троеточие:

extension String {
    subscript(_ r: CountableRange<Int>) -> String {
        get{
         print(self)
           return  String(self[index(startIndex, offsetBy: r.lowerBound)..<index(startIndex, offsetBy: r.upperBound)])
        }
        set{
            let start = self[..<index(startIndex, offsetBy: r.lowerBound)]
            let finish = self[index(startIndex, offsetBy: r.upperBound)...]
            self = String(start) + newValue + String(finish)
        }
    }
    func truncate(_ cut : Int) -> String {
        
        if cut <= self.count{
             return String(self[0..<cut]) + "..."
        } else {
             return self
        }
    }
}


var test = "0123456789"

test[0..<1]
test[5..<9]

test[1..<8] = "ffff"

test


let name = "The Grapes of Wrath"
name.truncate(5)
name

/*
 extension Int{
 
 var isEven : Bool {
 return self % 2 == 0
 }
 var isOdd : Bool {
 return !isEven
 }
 enum EvenOrOdd  {
 case Even
 case Odd
 }
 var evenOfOdd : EvenOrOdd{
 return isEven ? .Even : .Odd
 }
 func pow(_ value : Int) -> Int {
 var temp = self
 for _ in 1..<value{
 temp *= self
 }
 return temp
 }
 mutating func powTo(_ value : Int){
 self = pow(value)
 }
 var binaryString : String {
 var result = ""
 for i in 0..<8{
 result = String(self & (1 << i) > 0) + result
 }
 return result
 }
 
 }
 
 extension String{
 init(_ value  : Bool) {
 self.init(value ? 1 : 0)
 }
 subscript(start : Int, length : Int ) -> String{
 
 return ""
 }
 }
 
 extension Int.EvenOrOdd {
 var string : String {
 switch self {
 case .Even: return "even"
 case .Odd: return "odd"
 }
 }
 }
 
 var a = 5
 
 if a.isOdd{
 print(a)
 }
 
 a.evenOfOdd
 a.evenOfOdd.string
 a.pow(3)
 a
 a.powTo(3)
 
 a.binaryString
 */
/*
 extension Int{
 
 var isEven : Bool {
 return self % 2 == 0
 }
 var isOdd : Bool {
 return !isEven
 }
 enum EvenOrOdd  {
 case Even
 case Odd
 }
 var evenOfOdd : EvenOrOdd{
 return isEven ? .Even : .Odd
 }
 func pow(_ value : Int) -> Int {
 var temp = self
 for _ in 1..<value{
 temp *= self
 }
 return temp
 }
 mutating func powTo(_ value : Int){
 self = pow(value)
 }
 var binaryString : String {
 var result = ""
 for i in 0..<8{
 result = String(self & (1 << i) > 0) + result
 }
 return result
 }
 
 }
 
 extension String{
 init(_ value  : Bool) {
 self.init(value ? 1 : 0)
 }
 subscript(start : Int, length : Int ) -> String{
 
 return ""
 }
 }
 
 extension Int.EvenOrOdd {
 var string : String {
 switch self {
 case .Even: return "even"
 case .Odd: return "odd"
 }
 }
 }
 
 var a = 5
 
 if a.isOdd{
 print(a)
 }
 
 a.evenOfOdd
 a.evenOfOdd.string
 a.pow(3)
 a
 a.powTo(3)
 
 a.binaryString
 */


