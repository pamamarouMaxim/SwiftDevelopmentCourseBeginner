//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
var a : UInt8 = 10

a = a << 1

print(a)

a = a << 3

print(a)

a = a >> 4

print(a)

//a = a & * 100

a = 0b11111111

a = a &+ 1

//   бит опереции

var b : UInt8 = 0b00110011
var c : UInt8 = 0b11100001

(b | c)  // как или

(b & c) // как и

(b ^ c)// исключающее или
(~b)// инверсия 0 на 1    1 на 0

// проверка установлен ли 3 бит in c - чтение

b = 0b00010000
(b & c)

// установка бита через или
//  сброс бита если он установлен или поставить его если не установлен через  a & ~b
 
 */

//1. Расширьте енум из урока и добавьте в него метод, помогающий установить соответствующий бит в переданную маску и метод, помогающий его прочитать. Эти методы должны принимать и возвращать маску, либо принимать адрес маски и менять его
//
//2. Создать цикл, который будет выводить 1 байтное число с одним установленным битом в такой последовательности, чтобы в консоли получилась вертикальная синусоида
//
//3. Создайте 64х битное число, которое представляет клетки на шахматной доске. Установите биты так, что 0 - это белое поле, а 1 - черное. Младший бит это клетка а1 и каждый следующий байт начинается с клетки а (а2, а3, а4) и заканчивается клеткой h(h2, h3, h4). Выбирая клетки но индексу столбца и строки определите цвет клетки опираясь исключительно на значение соответствующего бита

enum Checlist : UInt8{
    case Apple  = 0b00000001
    case Potato = 0b00000010
    case Milk   = 0b00000100
    case Cheese = 0b00001000
}

extension Checlist{
    
    static func setBit(_ checlist : Checlist , value : inout UInt8){
        value = (value | checlist.rawValue)
    }
    
     static func purchases(_ checlist : UInt8) -> String {
        var purchase = "Purchases : "
        for value in 0..<8{
            let mask = 1 << value
            if (UInt8(mask) & checlist) != 0 {
                switch UInt8(mask) {
                case Checlist.Apple.rawValue :  purchase += "Apple"  + ";"
                case Checlist.Potato.rawValue:  purchase += "Potato" + ";"
                case Checlist.Milk.rawValue  :  purchase += "Milk"   + ";"
                case Checlist.Cheese.rawValue:  purchase += "Cheese" + ";"
                default: ""
                }
            }
        }
        print("\(purchase)")
        return purchase
    }
}

var number : UInt8 = 0b00000000

Checlist.setBit(.Apple, value: &number)
Checlist.setBit(.Milk, value: &number)
Checlist.setBit(.Cheese, value: &number)

Checlist.purchases(number)

//2. Создать цикл, который будет выводить 1 байтное число с одним установленным битом в такой последовательности, чтобы в консоли получилась вертикальная синусоида


extension UInt8 {
    
    func binary(){
        var result = ""
        for i in 0..<8 {
            let mask = 1 << i
            let set = Int(self) & mask != 0
            result = (set ? "1" : "0") + result
        }
        print(result)
    }
}

func sinus(countOfRepeat : Int, function : (UInt8,Int) -> ()){
    for _ in 0...countOfRepeat{
        let number : UInt8 = 0
        for i in 0..<8 {
            let mask = 1 << i
            function(number, mask)
        }
        for i in 0..<8 {
            let mask = 128 >> i
            function(number, mask)
    }
    }
    
}

sinus(countOfRepeat: 3) { (a, b) in
    let set = Int(a) | b
    UInt8(set).binary()
}

//3. Создайте 64х битное число, которое представляет клетки на шахматной доске. Установите биты так, что 0 - это белое поле, а 1 - черное. Младший бит это клетка а1 и каждый следующий байт начинается с клетки а (а2, а3, а4) и заканчивается клеткой h(h2, h3, h4). Выбирая клетки но индексу столбца и строки определите цвет клетки опираясь исключительно на значение соответствующего бита

// a1 =  черное 1 b1 белое
// а2 = белое 2
//
// 101010......1


func createBoard() -> (Int){
    var number = 0
    for row in 0..<8 {
        for column in 0..<8 {
            let mask = (column+row)%2 != 0 ? 0 : 1 << (column+row)
            number = mask | number
        }
    }
    return number
}

func finderCell(row : Character, number : Int) -> (String){
    let rows = "abcdefgh"
    var array = [Character]()
    for char in rows{
        array.append(char)
    }
    var mask = 0
    var item = 0
    for i in array{
        item += 1
        if i == row{
            mask = 1 << (number - 1 + item - 1)
            break
        }
    }
    let point = String(row) + String(number)
    return mask & createBoard() != 0 ? point + " is Black cell" : point + " is White cell"
}

finderCell(row: "a", number: 1)
finderCell(row: "a", number: 2)
finderCell(row: "b", number: 1)
finderCell(row: "h", number: 8)
finderCell(row: "c", number: 5)
