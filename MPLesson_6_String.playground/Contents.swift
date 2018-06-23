//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//        Lesson 5
//        Task 5.1
//1. Выполните задание #1 урока о базовых операторах: http://vk.com/topic-58860049_31536965
//только вместо forced unwrapping и optional binding используйте оператор ??
//
//Когда посчитаете сумму, то представьте свое выражение в виде строки
//Например: 5 + nil + 2 + 3 + nil = 10
//
//но в первом случае используйте интерполяцию строк, а во втором конкатенацию
//

let sringOne = "123"
let sringTwo = "1984"
let sringThree = "ad123"
let sringFour = "1223k"
let sringFive = "17091994"


var numberOne = Int(sringOne) ?? nil
var numberTwo = Int(sringTwo) ?? nil
var numberThree = Int(sringThree) ?? nil
var numberFour = Int(sringFour) ?? nil
var numberFive = Int(sringFive) ?? nil


let array = [numberOne,numberTwo,numberThree,numberFour,numberFive]


func printSumm(array : [Int?]){
    let suffix = "+"
    var stringSumm = String()
    for value in array{
        if let number = value{
            stringSumm += String(number) + suffix
        }
    }
    if stringSumm.hasSuffix(suffix){
        stringSumm.removeLast()
    }
    print(stringSumm)
}

printSumm(array: array)

let numberOneOne = Int(sringOne)    == nil ? nil : sringOne
let numberTwoTwo = Int(sringTwo)     == nil ? nil : sringTwo
let numberThreeThree = Int(sringThree) == nil ? nil : sringThree
let numberFourFour = Int(sringFour)  == nil ? nil : sringFour
let numberFiveFive = Int(sringFive)  == nil ? nil : sringFour

//        Task 5.3
//3. Создайте строку английский алфавит, все буквы малые от a до z
//
//задайте константу - один из символов этого алфавита
//
//Используя цикл for определите под каким индексов в строке находится этот символ


func numberOfLetter(letter : Character){
    let alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var i = 0
    for l in alph{
        i = i + 1
        if String(l).lowercased() == String(letter).lowercased() {
            print("number letter \(l) in alph = \(i)")
            break
        }
    }
}

numberOfLetter(letter: "c")
numberOfLetter(letter: "O")
numberOfLetter(letter: "W")
numberOfLetter(letter: "Z")

