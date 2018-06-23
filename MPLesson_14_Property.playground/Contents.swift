//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

import Foundation

 
//1. Самостоятельно повторить проделанное в уроке
//
//2. Добавить студенту property «Дата рождения» (пусть это будет еще одна структура, содержащая день, месяц, год) и два computed property: первое — вычисляющее его возраст, второе — вычисляющее, сколько лет он учился (считать, что он учился в школе с 6 лет, если студенту меньше 6 лет — возвращать 0)
//

let actualDate = (day: 11 , month : 4 , year : 2018)
let dayInMonth = 30
let monthsInYear = 12

struct DateOfBirth {
    
    var day  : Int
    var month: Int
    var year : Int
    var age  : Int {
        get {
            let days = (actualDate.year - year)*dayInMonth*monthsInYear + (actualDate.month - month)*dayInMonth + (actualDate.day - day)
            
            print("age = \(days) days")
            
            return days
            
        }
    }
    var studyTime : Int {
        get{
            if (actualDate.year - year) > 6{
                let dayAtschool = (actualDate.year - year - 6)*dayInMonth*monthsInYear + (actualDate.month - month)*dayInMonth + (actualDate.day - day)
                
                print("day At school = \(dayAtschool) days")
                
                return dayAtschool
            }
            return 0
            
        }
    }
    
}

struct Student {
    var name    : String{
        willSet{
            print("new name = \(newValue) old name =  \(name)")
        }
        didSet{
             print("new name = \(name) old name =  \(oldValue)")
        }
    }
    var lastName: String
    var fullName: String{
        set{
            var words = newValue.components(separatedBy: " ")
            if words.count > 0 {
                name = words[0]
            }
            if words.count > 1 {
                lastName = words[1]
            }
            
        }
        get{
            return name + " " + lastName
        }
    }
    var dateOfBirth : DateOfBirth
    
}

var student = Student(name: "Olga", lastName: "Korotkova", dateOfBirth: DateOfBirth(day: 15, month: 8, year: 1996))

student.name = "Oksana"

student.fullName = "Maxim Panamarou"

student.name
student.lastName
student.fullName
student.dateOfBirth.age
student.dateOfBirth.studyTime

//3. Создать структуру «Отрезок», содержащую две внутренние структуры «Точки». Структуру «Точка» создать самостоятельно, несмотря на уже имеющуюся в Swift’е. Таким образом, структура «Отрезок» содержит две структуры «Точки» — точки A и B (stored properties). Добавить два computed properties: « середина отрезка» и «длина» (считать математическими функциями)
//4. При изменении середины отрезка должно меняться положение точек A и B. При изменении длины, меняется положение точки B

struct Point{
    var point : (x : Double, y: Double)
}

struct Segment {
    var pointA : Point
    var pointB : Point
    var long   : Double{
        get{
    
            return   sqrt(pow((pointB.point.x -   pointA.point.x),2) + pow((pointB.point.y -   pointA.point.y),2))
        }
        set {
                let pointX = pointB.point.x + (newValue - long)*(pointB.point.x - pointA.point.x)/long
                let pointY = pointB.point.y + (newValue - long)*(pointB.point.y - pointA.point.y)/long
            
            print("long  of segment changed from \(long)  to \(newValue)")
            pointB.point.x = pointX
            pointB.point.y = pointY
           
        }
    }
    var midOfSegment : Point{
        get{
             return   Point(point: (x: (pointB.point.x -   pointA.point.x)/2 + pointA.point.x , y: (pointB.point.y -   pointA.point.y)/2 + pointA.point.y))
        }
    
        set {
            let pointAX = newValue.point.x - ( pointB.point.x - pointA.point.x)/2
            let pointAY = newValue.point.y - ( pointB.point.y - pointA.point.y)/2
            
            let pointBX = newValue.point.x + ( pointB.point.x - pointA.point.x)/2
            let pointBY = newValue.point.y + ( pointB.point.y - pointA.point.y)/2
            
            print("mid of segment changed from \(Int(midOfSegment.point.x),Int(midOfSegment.point.y)) " +
            "to \(Int(newValue.point.x),Int(newValue.point.y))")
            
            pointB = Point(point: (x: pointBX, y: pointBY))
            pointA = Point(point: (x: pointAX, y: pointAY))
            
        }
    }
}

var segment = Segment(pointA: Point(point: (x: 1, y: 1)),pointB : Point(point: (x: 5, y: 5)))

func printPropertyOfSegment (){
    print("segment have long = \(Int(segment.long)) point A location = \(Int(segment.pointA.point.x),Int(segment.pointA.point.y)) point B location =   \(Int(segment.pointB.point.x),Int(segment.pointB.point.y)) , mid of segment location = \(Int(segment.midOfSegment.point.x),Int(segment.midOfSegment.point.y)), long of segment = \(segment.long)")
}

printPropertyOfSegment()

segment.long = 140.11

printPropertyOfSegment()

segment.midOfSegment = Point(point: (x: 100, y: 100))

printPropertyOfSegment()






