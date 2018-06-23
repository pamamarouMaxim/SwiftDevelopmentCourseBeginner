//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//            Lesson 7
//            Tast 7.1
//1. создать массив "дни в месяцах"
//12 элементов содержащих количество дней в соответствующем месяце
//
//используя цикл for и этот массив
//
//    - выведите количество дней в каждом месяце (без имен месяцев)
//- используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
//- сделайте тоже самое, но используя массив тюплов с параметрами (имя месяца, кол-во дней)
//- сделайте тоже самое, только выводите дни в обратном порядке (порядок в массиве не меняется)
//
//- для произвольно выбранной даты (месяц и день) посчитайте количество дней до этой даты от начала года


var daysInMonths = [31,28,31,30,31,30,31,30,30,31,30,31]

for days in daysInMonths {
    print(days)
}

 let namesMonths = ["january" , "february"  ,"march",
                    "april", "may","june",
                    "jule","august"  , "september" ,
                    "october", "november", "december"]

var arrayOfMonthsAndDays = [(String,Int)]()

if namesMonths.count == daysInMonths.count{
    for i in 0..<namesMonths.count{
        print("\(namesMonths[i]) numbers of days is \(daysInMonths[i])")
        let tuple = (month : namesMonths[i] , number : daysInMonths[i])
        arrayOfMonthsAndDays.append(tuple)
    }
}

for (index,value) in arrayOfMonthsAndDays {
    print("month = \(index) days = \(value)")
}

for i in 0..<arrayOfMonthsAndDays.count {
    let number = arrayOfMonthsAndDays.count - i - 1
    print("month = \(arrayOfMonthsAndDays[number].0) days = \(arrayOfMonthsAndDays[number].1)")
}

let dateOfbirth = (month : 9 , day : 17)
var summ = 0

for i in 0..<daysInMonths.count{
    if i == (dateOfbirth.month - 1 ){
        summ += dateOfbirth.day
        break
    }
    summ += daysInMonths[i]
}
//              Task 7.2

//2. Сделайте первое задание к уроку номер 4 используя массивы:
//
//(создайте массив опшинал интов и посчитайте сумму)
//
//- в одном случае используйте optional binding
//- в другом forced unwrapping
//- а в третьем оператор ??


let arrayString = ["123", "43", "fwf3", "41f", "31"]
summ = 0

for element in arrayString{
    if Int(element) != nil {
        summ += Int(element)!
    }
}
print(summ)
summ = 0

for element in arrayString{
    if let value = Int(element){
        summ += value
    }
}

summ = 0

for element in arrayString{
    summ += Int(element) ?? 0
}
print(summ)

//          Task 7.3
//3. создайте строку алфавит и пустой массив строк
//
//в цикле пройдитесь по всем символам строки попорядку, преобразовывайте каждый в строку и добавляйте в массив, причем так, чтобы на выходе получился массив с алфавитом задом-наперед

var alphabet = [String]()

let alph = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

for char in alph{
    alphabet.insert(String(char), at: 0)
}
