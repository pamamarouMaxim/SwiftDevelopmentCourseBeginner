//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//            Task 10.1
//

//1. Создайте пару функций с короткими именами, которые возвращают строку с классным символом или символами. Например heart() возвращает сердце и т.п. Вызовите все эти функции внутри принта для вывода строки этих символов путем конкатенации.

let sparklingHeart = "\u{1F496}"
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
let dollarSign = "\u{24}"

func returhFlag() -> String{
    return "\u{1F1FA}\u{1F1F8}"
}

func returnHeart() -> String {
    return "\u{1F496}"
}

func returnDollars() -> String {
    return "\u{24}"
}

print("\(returhFlag()) has a \(returnDollars()). If you have a \(returnDollars()) you will have a \(returnHeart())")

//            Task 10.2

//
//2. Опять шахматные клетки. Реализовать функцию, которая принимает букву и символ и возвращает строку “белая” или “черная”. Строку потом распечатайте в консоль


func chessCell ( char : String , column : Int) -> String {
    let stringOfBoard = ["a" : 1,"b" : 2,"c" : 3,"d" : 4 ,"e" : 5 ,"f": 6,"g" : 7,"h" : 8]
    if let letter = stringOfBoard[char.lowercased()]{
        if column > 0 && column <= 8{
              return (letter + column)%2 == 0 ? "cell is white": "cell is black"
        }
    }
    return "Cell " + char + " " + String(column)  + " not found"
}

chessCell(char: "a", column: 1)
chessCell(char: "a", column: 2)
chessCell(char: "h", column: 7)
chessCell(char: "h", column: 8)
chessCell(char: "z", column: 2)
chessCell(char: "a", column: 9)

//          Task 10.3

//3. Создайте функцию, которая принимает массив, а возвращает массив в обратном порядке. Можете создать еще одну, которая принимает последовательность и возвращает массив в обратном порядке. Чтобы не дублировать код, сделайте так, чтобы функция с последовательностью вызывала первую.

func arrayBack (array : [Any]) -> [Any] {
    var reverseArray = [Any]()
    for value  in array{
        reverseArray.insert(value, at: 0)
    }
    return reverseArray
}

let arrayOfNumber = [1,2,3,4,5,6,7,8,9,10]

print("\(arrayBack(array: arrayOfNumber))")

func takeElements (element : Any...) -> [Any] {
    var array = [Any]()
    for i in element{
        array.append(i)
    }
    return arrayBack(array: array)
}

let numbers = (10,9,8,7,6,5,4,3,2,1)

print("\(takeElements(element: numbers))")

//        Task 10.4

//Разберитесь с inout самостоятельно и выполните задание номер 3 так, чтобы функция не возвращала перевернутый массив, но меняла элементы в существующем. Что будет если убрать inout?

func inOutArray (array : inout [Int]) {
    var reverceArray = [Int]()
    for i in array {
        reverceArray.insert(i, at: 0)
    }
    array = reverceArray
}

var inOutNumbers = [1,2,3,4,5,6,7,8,9,10]

inOutArray(array: &inOutNumbers)

inOutNumbers

//          Task 10.5

//5. Создайте функцию, которая принимает строку, убирает из нее все знаки препинания, делает все гласные большими буквами, согласные маленькими, а цифры меняет на соответствующие слова (9 -> nine и тд)


var textForTask = "2019 Chicago, the state of Illinois, is known as The Second City, which refers to its rebuilding after the fire. The current city is literally the second Chicago, after the one that disappeared in 1871. It can also refer to the city’s long-held position as the United States’ second largest city, after New York City.Today, Chicago is called as The Windy City. You might suspect that Chicago got this nickname from the winds off Lake Michigan, which shove through the downtown corridors with intense force. 17 09 1994"

var vowels   = "eyuioa"
let numerals = "1234567890"
var cognate  = "wrtplkhgfdszxcvbnm"
let space = " "



func changeText (text : String) -> String {
    var newText = String()
    for char in text{
        let letter = String(char).lowercased()
        switch letter {
        case _ where vowels.contains(letter)  : newText += String(char).uppercased()
        case _ where cognate.contains(letter) : newText += String(letter)
        case _ where numerals.contains(letter): newText += numberToString(char: char)
        case _ where space.contains(letter)   : newText += String(letter)
        default: break
        }
    }
    return newText
}

func numberToString (char : Character) -> String{
    var string = String()
    if let number = Int(String(char)){
        switch number {
        case 0: string = " zero "
        case 1: string = " one "
        case 2: string = " two "
        case 3: string = " three "
        case 4: string = " four "
        case 5: string = " five "
        case 6: string = " six "
        case 7: string = " seven "
        case 8: string = " eight "
        case 9: string = " nine "
        default: break
        }
    }
    return string
}

let changedText = changeText(text: textForTask)

print(changedText)




var i = 0

while i < 25{
    i += 1
}

repeat {
    print("hello")
    i += 1
} while  i < 30


//           Lesson 10
//            Task 10.1
/*
 
 
 // do not repeat ypurself  !!!
 
 let wallet  = [100, 200, 50 , 20, 50 , 50 , 50 , 50 , 50 ]
 
 
 
 func test(){
 print("test")
 }
 
 test()
 test()
 
 func calculateMoney(wallet : [Int]){
 var summ =  0
 for value  in wallet {
 summ += value
 }
 print("\(summ)")
 }
 
 calculateMoney(wallet: wallet)
 
 func calculateMoneyAndReturn( wallet : [Int]) -> Int{
 var summ =  0
 for value  in wallet {
 summ += value
 }
 print("\(summ)")
 return summ
 }
 
 let money = calculateMoneyAndReturn(wallet: wallet)
 
 func calculateMoneyAndReturnTwo(wallet : [Int], type :Int? = nil) -> (total : Int, count: Int){
 var summ =  0
 var count = 0
 for value  in wallet {
 summ += value
 count += 1
 }
 print("\(summ)")
 return (summ,count)
 }
 
 let tuple = calculateMoneyAndReturnTwo(wallet: wallet, type: 50)
 var (summma,count) = calculateMoneyAndReturnTwo(wallet: wallet, type: 50)
 calculateMoneyAndReturnTwo(wallet: wallet, type: 50).count
 
 func testfunct (test : Int ...) -> Int{
 
 var number = 0
 for value in test {
 number += value
 }
 return number
 }
 
 testfunct(test: 10,23,41335,245,454)
 */

/*
 func helloMax (person : String) -> String {
 
 return  "Hello" + person + "!!!"
 }
 
 print("\(helloMax(person: " Max "))")
 
 
 func helloWorld () -> () {
 print("Hello world!!!")
 }
 
 func doIcomeIn (person: String , maybe : Bool) -> String {
 
 if maybe{
 return person + " can come in"
 } else {
 return person + " doesn't can come in"
 }
 }
 
 print("\(doIcomeIn(person: "Olga", maybe: true))")
 print("\(doIcomeIn(person: "Alex", maybe: false))")
 
 func summOfNumbers (numbers : Int...) -> (summ : Int , count : Int) {
 var summ = 0
 var count = 0
 for number in numbers {
 summ  += number
 count += 1
 }
 return (summ,count)
 }
 
 let (sum,count) = summOfNumbers(numbers: 10,20,30,40)
 
 func optionalTest (number : Int?) -> Int {
 if let value = number{
 return value*10
 } else {
 return 0
 }
 }
 
 let optionalNumber = optionalTest(number: nil)
 
 
 //              Default Parameter Values
 
 func doYouHaveGirl (yourName: String , have: Bool = false ){
 if have {
 print("\(yourName) has a girl")
 } else {
 print("\(yourName) has not a girl")
 }
 }
 
 doYouHaveGirl(yourName: "Alex", have: true)
 doYouHaveGirl(yourName: "Vladislav")
 
 //       InOut
 
 func inOutTest (numberOne : inout Int , numberTwo : inout Int ){
 let valueOne = numberOne
 numberOne = numberTwo
 numberTwo = valueOne
 }
 
 var a = 100
 var b = 1
 
 inOutTest(numberOne: &a, numberTwo: &b)
 print(a,b)
 
 
 let newInOut = inOutTest
 */
//
/*
 func stepForward(_ input: Int) -> Int {
 return input + 1
 }
 func stepBackward(_ input: Int) -> Int {
 return input - 1
 }
 
 func chooseStepFunction(backward: Bool) -> (Int) -> Int {
 return backward ? stepBackward : stepForward
 }
 
 
 var currentValue = 3
 let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
 
 
 func chooseStepFunction(backward: Bool) -> (Int) -> Int {
 func stepForward(input: Int) -> Int { return input + 1 }
 func stepBackward(input: Int) -> Int { return input - 1 }
 return backward ? stepBackward : stepForward
 }
 var currentValue = -4
 let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
 // moveNearerToZero now refers to the nested stepForward() function
 while currentValue != 0 {
 print("\(currentValue)... ")
 currentValue = moveNearerToZero(currentValue)
 }
 print("zero!")
 */
