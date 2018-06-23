//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//          Lesson 11
//          Task 11.1

//1. Написать функцию, которая ничего не возвращает и принимает только один клоужер, который ничего не принимает и ничего не возвращает . Функция должна просто посчитать от 1 до 10 в цикле и после этого вызвать клоужер. Добавьте println в каждый виток цикла и в клоужер и проследите за очередностью выполнения команд.


func emptyClouser (clouser : () -> ()){
    for i in 0...10 {
        print(i)
    }
    clouser()
}

emptyClouser {
     print("Max")
}

//         Task 11.2

//
//2. Используя метод массивов sorted, отсортируйте массив интов по возрастанию и убыванию. Пример показан в методичке.

var numbers = [31,34,13,1,4,6,8,3,9,0,65,700,4,1,4,662,10]

 var newNumber = numbers.sorted { (a, b) -> Bool in
    return a < b
}

newNumber = numbers.sorted(by: { a, b in
    return a > b } )

newNumber = numbers.sorted(by: { $0 < $1 })


//            Task 11.3

//
//3. Напишите функцию, которая принимает массив интов и клоужер и возвращает инт. Клоужер должен принимать 2 инта (один опшинал) и возвращать да или нет. В самой функции создайте опшинал переменную. Вы должны пройтись в цикле по массиву интов и сравнивать элементы с переменной используя клоужер. Если клоужер возвращает да, то вы записываете значение массива в переменную. в конце функции возвращайте переменную.
//
//используя этот метод и этот клоужер найдите максимальный и минимальный элементы массива.
//


func sortedArray (array : [Int] , function : (Int?, Int) -> Bool) -> Int{
    
    var number: Int?
    for value in array{
        if function(number, value){
              number =  value
        }

    }
    return number ?? 0
}

var number = [3,1,4,2,5,25,244,245,2,5,6,2]

let max = sortedArray(array: number) {
    $0 == nil || $0! < $1
}

let min = sortedArray(array: number) {
    $0 == nil || $0! > $1
}

//      Task 11.4


//4. Создайте произвольную строку. Преобразуйте ее в массив букв. Используя метод массивов sorted отсортируйте строку так, чтобы вначале шли гласные в алфавитном порядке, потом согласные, потом цифры, а потом символы


var text = " alndj A u uehiwh 23e 232 9  8u 8 as adbby1ou 7oid8y'kpo3kpfj23ni1cu9yb47st" +
           "b8y7d1by84dt178ob14u1ouhhbjvhczl23'23grkljbhghj hv785eaw`ooi'/..pl..] jcgig23"

func priority(string : String) -> Int {
    switch string.lowercased() {
    case "e","y","u","a","o","i": return 0
    case "a"..."z": return 1
    case "0"..."9": return 2
    default: return 3
    }
}

var arrayOfLetter = [String]()

for letter in text{
    arrayOfLetter.append(String(letter))
}

var newAffayOfLetter = arrayOfLetter.sorted { a, b in
    switch (priority(string: a), priority(string: b)) {
    case let (x,y) where x < y : return true
    case let (x,y) where x > y : return false
    default: return a.lowercased() <= b.lowercased() ? true : false
    }
}

print(newAffayOfLetter)

/*
let textForTest = "max"

for i in textForTest {
   print("\(String(i).unicodeScalars)")
}


let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward ( s1 : String , s2 : String) -> Bool{
    return s2 < s1
}

var reversedNames = names.sorted(by: backward)

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )

reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

reversedNames = names.sorted(by: { $0 > $1 } )

reversedNames = names.sorted(by: >)


func someFunctionThatTakesAClosure(closure: () -> Void) {
    for _ in 0...1{
    print("hello")
    }
   
}


someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numberss = [16, 58, 510]

let strings = numberss.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

var customersInLine = ["Char", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 1) }
print(customersInLine.count)
// Prints "5"

print("Now serving \(customerProvider())!")
print("Now serving \(customerProvider())!")
print("Now serving \(customerProvider())!")

// Prints "Now serving Chris!"
print(customersInLine.count)
*/

