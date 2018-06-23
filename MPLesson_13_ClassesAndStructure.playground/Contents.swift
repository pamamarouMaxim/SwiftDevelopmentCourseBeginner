//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// 1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).

struct StudentStructure {
    var name : String
    var soName: String
    var averageMark : Double
    var dateOfBirth : (day : Int, month : Int, year : Int)
    
}


var student1 = StudentStructure(name: "max",  soName : "Potapova", averageMark: 8.6 , dateOfBirth: (day: 17, month: 9, year: 1994))
var student2 = StudentStructure(name: "alina", soName : "Auru",  averageMark: 9.6 , dateOfBirth: (day: 13, month: 1, year: 1993))
var student3 = StudentStructure(name: "vlad", soName : "Zulatov",  averageMark: 2.1 , dateOfBirth: (day: 18, month: 12, year: 1966))
var student4 = StudentStructure(name: "kazimir", soName : "Auru" ,  averageMark: 4.1 , dateOfBirth: (day: 13, month: 7, year: 1951))
var student5 = StudentStructure(name: "zurap", soName : "Zulatov" ,  averageMark: 5.2 , dateOfBirth: (day: 12, month: 6, year: 1978))

var arrayOfStudents = [student1, student2, student3,student4,student5]


// 2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.

func printArrayOfStudent (array : [StudentStructure]){
    var numberOfStudent = 0
    for i in array{
        numberOfStudent += 1
        print("number in journal = \(numberOfStudent), name = \(i.name), soName = \(i.soName), averageMark = \(i.averageMark) , date of birth = \(i.dateOfBirth) ")
    }
}


printArrayOfStudent(array: arrayOfStudents)
print("---------------------------------------------------------Journal 1-------------------------------------------------------------------")


//3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.

arrayOfStudents = arrayOfStudents.sorted { a, b in
     a.averageMark > b.averageMark
    
}

printArrayOfStudent(array: arrayOfStudents)
print("---------------------------------------------------------Journal 2-------------------------------------------------------------------")


//4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.


arrayOfStudents = arrayOfStudents.sorted { a, b  in
    a.soName > b.soName ?  a.name < b.name :   a.soName < b.soName
    
}

printArrayOfStudent(array: arrayOfStudents)

//5. Создайте переменную и присвойте ей ваш существующий массив. Измените в нем данные всех студентов. Изменится ли первый массив? Распечатайте оба массива.

var newArray = arrayOfStudents

for i in 0..<newArray.count{
    newArray[i].averageMark = 11
}

print("---------------------------------------------------------Journal 3-------------------------------------------------------------------")


printArrayOfStudent(array: newArray)
printArrayOfStudent(array: arrayOfStudents)

print("---------------------------------------------------------Journal 4-------------------------------------------------------------------")


//6. Теперь проделайте все тоже самое, но не для структуры Студент, а для класса. Какой результат в 5м задании? Что изменилось и почему?

class StudentClass{
    
    var name : String
    var soName: String
    var averageMark : Double
    var dateOfBirth : (day : Int, month : Int, year : Int)
    
    init(name : String, soName : String, averageMark : Double , dateOfBirth : (day : Int, month : Int, year : Int)) {
        self.name = name
        self.soName = soName
        self.averageMark = averageMark
        self.dateOfBirth = dateOfBirth
    }
}

var studentClass1 = StudentClass(name: "max",  soName : "Potapova", averageMark: 8.6 , dateOfBirth: (day: 17, month: 9, year: 1994))
var studentClass2 = StudentClass(name: "alina", soName : "Auru", averageMark: 9.6 , dateOfBirth: (day: 13, month: 1, year: 1993))
var studentClass3 = StudentClass(name: "vlad", soName : "Zulatov", averageMark: 2.1 , dateOfBirth: (day: 18, month: 12, year: 1966))
var studentClass4 = StudentClass(name: "kazimir", soName : "Auru", averageMark: 4.1 , dateOfBirth: (day: 13, month: 7, year: 1951))
var studentClass5 = StudentClass(name: "zurap", soName : "Zulatov", averageMark: 5.2 , dateOfBirth: (day: 12, month: 6, year: 1978))

var arrayOfstudentClass = [studentClass1,studentClass2,studentClass3,studentClass4,studentClass5]

func printArrayOfStudentClass (array : [StudentClass]){
    var numberOfStudent = 0
    for i in array{
        numberOfStudent += 1
        print("number in journal = \(numberOfStudent), name = \(i.name), soName = \(i.soName), averageMark = \(i.averageMark) , date of birth = \(i.dateOfBirth) ")
    }
}

printArrayOfStudentClass(array: arrayOfstudentClass)
print("---------------------------------------------------------Journal 5-------------------------------------------------------------------")


arrayOfstudentClass = arrayOfstudentClass.sorted { a,b in
    a.averageMark > b.averageMark
}

printArrayOfStudentClass(array: arrayOfstudentClass)
print("----------------------------------------------------------Journal 6-----------------------------------------------------------------")

for i in 0..<arrayOfstudentClass.count{
    arrayOfstudentClass[i].name = "Hello"
    arrayOfstudentClass[i].soName = "World"
     arrayOfstudentClass[i].averageMark = 10
     arrayOfstudentClass[i].dateOfBirth = (0,0,0)
}

printArrayOfStudentClass(array: arrayOfstudentClass)

//007. Уровень супермен
//
//Выполните задание шахмат из урока по энумам используя структуры либо классы

enum Figure{
    enum name : String{
        case king   = "king"
        case queen  = "queen"
        case knight = "knight"
        case rook   = "rook"
        case bishop = "bishop"
        case pawn   = "pawn"
    }
    
}

enum UnicodeName {
        enum unicodeImageWhite : String {
            case king   = "\u{2654}"
            case queen  = "\u{2655}"
            case knight = "\u{2658}"
            case rook   = "\u{2657}"
            case bishop = "\u{2656}"
            case pawn   = "\u{2659}"
        }
        enum unicodeImageBlack : String {
            case king   = "\u{265A}"
            case queen  = "\u{265B}"
            case knight = "\u{265E}"
            case rook   = "\u{265d}"
            case bishop = "\u{265C}"
            case pawn   = "\u{265F}"
        }
    }


enum ColorOfCell : String{
        case white   = "\u{25FE}"
        case black   = "\u{25FD}"
    }

class FigureOfChess{
    var name  : Figure.name
    var point : (Int,Int)
    var UnicodeName : String
    
    init(name: Figure.name, point : (Int, Int), unicode : String) {
        
        self.name = name
        self.point = point
        self.UnicodeName = unicode
    }
}

func createPawn() -> [FigureOfChess]{
    
    var pawn = FigureOfChess(name: .pawn, point: (0, 0), unicode: UnicodeName.unicodeImageBlack.pawn.rawValue )
    
    var arrayOfPawn = [FigureOfChess]()
    
    for row in 0...1 {
        for column in 1...8{
            if row == 0 {
               pawn = FigureOfChess(name: .pawn, point: (2, column), unicode: UnicodeName.unicodeImageWhite.pawn.rawValue )
            } else {
               pawn = FigureOfChess(name: .pawn, point: (7, column), unicode: UnicodeName.unicodeImageBlack.pawn.rawValue )
            }
                arrayOfPawn.append(pawn)
        }
    }
    return arrayOfPawn
}

func createFigures (funct : (Int,Int)->(FigureOfChess)) -> [FigureOfChess]{
    var arrayOfFigures = [FigureOfChess]()
    for row in 1...2{
        for column in 1...8{
            arrayOfFigures.append( funct(row, column))
        }
    }
    return arrayOfFigures
}

var arrayOfFigures = createFigures { (a, b) -> (FigureOfChess) in
    var figure = FigureOfChess(name: .pawn, point: (0, 0), unicode: UnicodeName.unicodeImageBlack.pawn.rawValue )
    switch (a,b) {
    case (1,1),(1,8),(2,1),(2,8):
        figure =  a == 1 ? FigureOfChess(name: .bishop, point: (a, b), unicode: UnicodeName.unicodeImageWhite.bishop.rawValue ) :
                           FigureOfChess(name: .bishop, point: (8, b), unicode: UnicodeName.unicodeImageBlack.bishop.rawValue )
        
    case (1,2),(1,7),(2,2),(2,7):
        
        figure =  a == 1 ? FigureOfChess(name: .knight, point: (a, b), unicode: UnicodeName.unicodeImageWhite.knight.rawValue ) :
                           FigureOfChess(name: .knight, point: (8, b), unicode: UnicodeName.unicodeImageBlack.pawn.rawValue )
        
    case (1,3),(1,6),(2,3),(2,6):
        figure =  a == 1 ? FigureOfChess(name: .rook, point: (a, b), unicode: UnicodeName.unicodeImageWhite.rook.rawValue )     :
                           FigureOfChess(name: .rook, point: (8, b), unicode: UnicodeName.unicodeImageBlack.rook.rawValue )
        
    case (1,4),(2,4):
        figure =  a == 1 ? FigureOfChess(name: .king, point: (a, b), unicode: UnicodeName.unicodeImageWhite.king.rawValue )     :
                           FigureOfChess(name: .king, point: (8, b), unicode: UnicodeName.unicodeImageBlack.king.rawValue )
        
    case (1,5),(2,5):
        figure =  a == 1 ? FigureOfChess(name: .queen, point: (a, b), unicode: UnicodeName.unicodeImageWhite.queen.rawValue )   :
                           FigureOfChess(name: .queen, point: (8, b), unicode: UnicodeName.unicodeImageBlack.queen.rawValue )
        
    default: break
    }
    return figure
}

var arrayOfFigure = arrayOfFigures + createPawn()

func printBoardWithFihure (array : [FigureOfChess]){
    
    for row in 1...8{
        var cell = String()
        for column in 1...8{
            var count = 0
            for figure in array{
                if figure.point == (row,column) {
                    count += 1
                    cell += figure.UnicodeName
                }
            }
            if count == 0 {
                if (row + column)%2 == 0{
                    cell += ColorOfCell.white.rawValue
                } else {
                    cell += ColorOfCell.black.rawValue
                }
            }
            count = 0
        }
        print(cell)
        cell = String()
    }
}

printBoardWithFihure(array: arrayOfFigure)

func moveFigure (oldArray : [FigureOfChess],fromPoint: (Int,Int), toPoint :(Int,Int)) -> [FigureOfChess]{
    var array = [FigureOfChess]()
    var count = 0
    switch (toPoint.0, toPoint.1,fromPoint.0,fromPoint.1) {
    case (1...8,1...8,1...8,1...8):
        
        for i in oldArray{
            if i.point == toPoint{
                print("The cell\(toPoint.0,toPoint.1) is busy")
                return oldArray
            }
            if i.point == fromPoint {
                count = count + 1
                let newFigure = FigureOfChess(name: i.name, point: (toPoint.0, toPoint.1), unicode: i.UnicodeName)
                print("\(i.name) from point \(fromPoint) =  go to new poin \(toPoint)")
                array.append(newFigure)
            } else {
                array.append(i)
            }
        }
        
        if count == 0 {
            print("figure dont found.The cell\(fromPoint.0,fromPoint.1) is empty")
            return oldArray
        } else {
            return array
        }
    default:  print("you can not do this move from \(fromPoint) to \(toPoint). chess board 8x8")
    return oldArray
    }
}

arrayOfFigure = moveFigure(oldArray: arrayOfFigure, fromPoint: (1,1), toPoint: (5,5))
printBoardWithFihure(array: arrayOfFigure)
