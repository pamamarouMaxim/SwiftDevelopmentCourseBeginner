//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//                Lesson 2 базовые типы
//                Task 2.1
// Выведите в консоль минимальные и максимальные значения базовых типов, не ленитесь :)
print("Int 8 max  = \(Int8.max)\n"  +
      "Int 8 min  = \(Int8.min)\n"  +
      "Int 16 max = \(Int16.max)\n" +
      "Int 16 min = \(Int16.min)\n" +
      "Int 32 max = \(Int32.max)\n" +
      "Int 32 min = \(Int32.min)\n" +
      "Int 64 max = \(Int32.max)\n" +
      "Int 64 min = \(Int32.min)\n" )

//                 Task 2.2
/*
2. Создайте 3 константы с типами Int, Float и Double

Создайте другие 3 константы, тех же типов: Int, Float и Double,

при чем каждая из них это сумма первых трех, но со своим типом
*/
//Сравните Int результат суммы с Double и выведите отчет в консоль

let valueInteger = 10
let valueFloat : Float = 17.1
let valueDouble = 10.007

let summInteger =  valueInteger + Int(valueFloat) + Int(valueDouble)
let summFloat   =  Float(valueInteger) + valueFloat + Float(valueDouble)
let summDouble  = Double(valueInteger) + Double(valueFloat) + valueDouble
//                 Task 2.3
let arrayOfNumber = [Double(summInteger), Double(summFloat) , summDouble]

for i in arrayOfNumber {
    if i == arrayOfNumber.max(){
        print("max value is \(i)")
    } else if i == arrayOfNumber.min(){
        print("min value is \(i)")
    } else {
        print("mid value is \(i)")
    }
}

//              Lesson 3 Tuple
//                Task 3.1
//    Создать тюпл с тремя параметрами:
//
//    - максимальное количество отжиманий
//    - максимальное количество подтягиваний
//    - максимальное количество приседаний
//
//    Заполните его своими достижениями :)
//
//    Распечатайте его через println()

var myParameters = (age : 23 , height : 186 , weight : 80)

print(myParameters)


//                 Task 3.2

/*
2. Также сделайте три отдельных вывода в консоль для каждого параметра

При том одни значения доставайте по индексу, а другие по параметру

между соответствующими значениями первого и второго тюплов
*/

print("age = \(myParameters.age) , height = \(myParameters.height) , weight = \(myParameters.weight)")

print("age = \(myParameters.0) , height = \(myParameters.1) , weight = \(myParameters.2)")

//                  Task 3.3
//3. Создайте такой же тюпл для другого человека (супруги или друга)
//
//с такими же параметрами, но с другими значениями
//
//Используйте промежуточную переменную чтобы поменять соответствующие значения
//
//первого тюпла на значения второго

var friendParametrs = (age : 24 , height : 190 , weight : 92)


let (myAge, myHeight, myWeight) = (myParameters.age, myParameters.height, myParameters.weight)

myParameters = friendParametrs

friendParametrs = (myAge,myHeight,myWeight)

//                   Task 3.4
//4. Создайте третий тюпл с теми же параметрами, но значения это разница

var differenceOfParametrs = myParameters

differenceOfParametrs.0 = myParameters.0 - friendParametrs.0
differenceOfParametrs.1 = myParameters.1 - friendParametrs.1
differenceOfParametrs.2 = myParameters.2 - friendParametrs.2

differenceOfParametrs

//                  Lesson 4
//1. Создать пять строковых констант
//
//Одни константы это только цифры, другие содержат еще и буквы
//
//Найти сумму всех этих констант приведя их к Int
//
//(Используйте и optional binding и forced unwrapping)


let hello = "Hello"
let name = "Max17"
let age = "23"
let year = "1994"

let array = [hello,name,age,year]

for i in array {
    if let value = Int(i) {
        print("Lesson 4 = \(value)")
    }
}

//
//2. С сервера к нам приходит тюпл с тремя параметрами:
//
//statusCode, message, errorMessage (число, строка и строка)
//
//в этом тюпле statusCode всегда содержит данные, но сама строка приходит только в одном поле
//
//если statusCode от 200 до 300 исключительно, то выводите message,
//
//в противном случает выводите errorMessage
//
//После этого проделайте тоже самое только без участия statusCode
//

let error : String? = nil

let server = (statusCode : 250, message :"Server responded", errorMessage:error)

if 200 ... 299 ~= server.statusCode {
    print(server.message)
} else {
    if let mistake = server.errorMessage{
         print(mistake)
    }
}

//3. Создайте 5 тюплов с тремя параметрами:
//
//имя, номер машины, оценка за контрольную
//
//при создании этих тюплов не должно быть никаких данных
//
//после создания каждому студенту установите имя
//
//некоторым установите номер машины
//
//некоторым установите результат контрольной
//
//выведите в консоль:

var student1 : (name : String, numberOfCar: Int?, mark: Int?)

//                  Lesson 5
//                  Task 5.1
//1. Посчитать количество секунд от начала года до вашего дня рождения. Игнорируйте високосный год и переходы на летнее и зимнее время. Но если хотите - не игнорируйте :)

let secondInMinute = 60
let minuteInHour = 60
let hourInDay = 24
let dayInMonth = 30
let myMonthNumber = 9
let myDayOfBirth = 17
let monthsInYear = 12

let dateOfDirthSecond = ((myMonthNumber - 1 ) * dayInMonth  + myDayOfBirth) * hourInDay * minuteInHour * secondInMinute

                    // Task 5.2
//2. Посчитайте в каком квартале вы родились

let numberOfKvartal : Float = 4

var kvartalOfDayOfBirth = Int((Float(myMonthNumber) /  Float(monthsInYear)) * numberOfKvartal)

                    // Task 5.4

//4. Шахматная доска 8х8. Каждое значение в диапазоне 1…8. При заданных двух значениях по вертикали и горизонтали определите цвет поля. Если хотите усложнить задачу, то вместо цифр на горизонтальной оси используйте буквы a,b,c,d,e,f,g,h

let string  = (1,2,3,4,5,6,7,8)
let column  = (a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8)

let selectedString = string.5

let selectedColumn = column.a

let field = (string : selectedString , column : selectedColumn);

if ((field.string + field.column)%2) > 0 {
    print("cell is black")
} else {
    print("cell is white")
}



