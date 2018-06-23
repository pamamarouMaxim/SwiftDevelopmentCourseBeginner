//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1. Для нашей структуры Point перегрузить операторы: -, -=, prefix —, postfix —, /, /=, *=
//
//2. Создать структуру Rect, аналог CGRect, содержащую структуру Size и Point. Перегрузить операторы +, += для этой структуры.
//
//3. Перегрузить оператор + и += для String, но второй аргумент должен быть Int
//
//4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы

struct Point{
    var x : Int
    var y : Int
}


func -(a : Point,b: Point) -> Point{
    return Point(x: a.x - b.x, y: a.y - b.y)
}

func +(a : Point,b: Point) -> Point{
    return Point(x: a.x + b.x, y: a.y + b.y)
}

func -=(a : inout Point,b: Point){
    a = a - b
}

prefix func --(point : inout Point){
    point -= Point(x: 1, y: 1)
}

postfix func --(point : inout Point) -> Point{
    let tmp = point
    point -= Point(x: 1, y: 1)
    return tmp
}

func / (a : Point,b: Point) -> Point{
    return Point(x: a.x / b.x, y: a.y / b.y)
}

func *= (pointA : inout Point, pointB : Point){
    pointA.x = pointA.x * pointB.x
    pointA.y = pointA.y * pointB.y
}

func /= (pointA : inout Point, pointB : Point){
    pointA = pointA / pointB
}

var p1 = Point(x: 5, y: 5)
var p2 = Point(x: 9, y: 9)

//2. Создать структуру Rect, аналог CGRect, содержащую структуру Size и Point. Перегрузить операторы +, += для этой структуры.

struct Size {
    var width  : Int
    var height : Int
}
struct Rect{
    var point : Point
    var size  : Size
}

func +(rectOne : Rect, rectTwo : Rect) -> Rect{
    let arrayX = [rectOne.point.x,rectTwo.point.x,rectOne.point.x + rectOne.size.width,rectTwo.point.x + rectTwo.size.width]
    let arrayY = [rectOne.point.y,rectTwo.point.y,rectOne.point.y + rectOne.size.height,rectTwo.point.y + rectTwo.size.height]
    
   return Rect(point: Point(x: arrayX.min()!, y: arrayY.min()!), size: Size(width: arrayX.max()! - arrayX.min()!, height: arrayY.max()! - arrayY.min()!))
}

func +=(rectOne : inout Rect, rectTwo : Rect) {
    rectOne = rectOne + rectTwo
}

//3. Перегрузить оператор + и += для String, но второй аргумент должен быть Int

func +( string : String, number : Int) -> String{
    return string + String(number)
}

func +=( string : inout String, number : Int){
     string = string + number
}

var testString = "Hello"

let number = 123

testString + number
testString += number
testString

//4. Создать свой оператор, который будет принимать 2 String и в первом аргументе, при совпадении буквы с вторым аргументом, менять совпадения на заглавные буквы

infix operator +++

func +++(text : String , search : String) -> String{
    let result  = text.flatMap {search.contains($0) ? String($0).uppercased() : String("\($0)")}
    return String(result)
}

let text = "Anyone who reads Old and Middle English literary texts will be familiar with the mid-brown volumes of the EETS, with the symbol of Alfred's jewel embossed on the front cover. "
var result = text +++ "ohjcmwojcen"

print("\(result)")

//           Example

/*
 struct Point{
 var x : Int
 var y : Int
 }
 
 var p1 = Point(x: 2, y: 3)
 var p2 = Point(x: 4, y: 5)
 
 func +(a: Point,b: Point) -> Point {
 return Point(x: a.x + b.x, y: a.y + b.y)
 }
 
 func *(a: Point,b: Point) -> Point {
 return Point(x: a.x * b.x, y: a.y * b.y)
 }
 
 p1 + p2
 
 p1 * p2
 
 // p1 += p2 не работает для func +
 func += ( a: inout Point,b: Point){
 a = a + b
 }
 
 p1 += p2
 p1
 
 func ==(a: Point,b: Point) -> Bool {
 return a.x == b.x || a.y == b.y
 }
 
 p1 == p2
 
 prefix func ++(a: inout Point){
 a.x += 1
 a.y += 1
 }
 
 postfix func ++(a: inout Point){
 a.x += 1
 a.y += 1
 }
 
 p1
 p1++
 ++p1
 p1
 
 //  свой опереатор
 // 1 объявить опереатор
 
 infix operator %%%
 
 func %%%(a: inout Point, b : Point){
 a.x += 100
 a.y += 100
 }
 
 p1 %%% p2
 */
