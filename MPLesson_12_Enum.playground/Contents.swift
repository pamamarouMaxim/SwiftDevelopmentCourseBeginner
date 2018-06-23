//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//            Lesson 12

/*
//1. Создать энум с шахматными фигруами (король, ферзь и т.д.). Каждая фигура должна иметь цвет белый либо черный (надеюсь намек понят), а так же букву и цифру для позиции. Создайте пару фигур с расположением на доске, так, чтобы черному королю был мат :) Поместите эти фигуры в массив фигур
//
//2. Сделайте так, чтобы энумовские значения имели rawValue типа String. Каждому типу фигуры установите соответствующее английское название. Создайте функцию, которая выводит в консоль (текстово, без юникода) название фигуры, цвет и расположение. Используя эту функцию распечатайте все фигуры в массиве.
//
//3. Используя красивые юникодовые представления шахматных фигур, выведите в консоли вашу доску. Если клетка не содержит фигуры, то используйте белую или черную клетку. Это должна быть отдельная функция, которая распечатывает доску с фигурами (принимает массив фигур и ничего не возвращает)
//
//4. Создайте функцию, которая будет принимать шахматную фигуру и тюпл новой позиции. Эта функция должна передвигать фигуру на новую позицию, причем перемещение должно быть легальным: нельзя передвинуть фигуру за пределы поля и нельзя двигать фигуры так, как нельзя их двигать в реальных шахматах (для мегамонстров программирования). Вызовите эту функцию для нескольких фигур и распечатайте поле снова.
*/

enum figure {
    enum color : String{
        case blackFigure = "Black color"
        case whiteFigure = "White color"
    }
    
    enum name : String {
        case king   = "king"
        case queen  = "queen"
        case knight = "knight"
        case rook   = "rook"
        case bishop = "bishop"
        case pawn   = "pawn"
    }

}

typealias Chess = (name     : figure.name,
                   color    : figure.color,
                   location : (Int,Int))

func createPawn() -> [Chess]{
    
    var arrayOfPawn = [Chess]()
    var chess = Chess(name: .pawn, color: .whiteFigure, location:(0,0))
    for row in 0...1 {
        for column in 1...8{
            if row == 0 {
                  chess = Chess(name: .pawn, color: .whiteFigure, location:(2,column))
            } else {
                  chess = Chess(name: .pawn, color: .blackFigure, location:(7,column))
            }
            arrayOfPawn.append(chess)
        }
    }
    return arrayOfPawn
}


func createFigures (funct : (Int,Int)->(Chess)) -> [Chess]{
    var arrayOfFigures = [Chess]()
    for row in 1...2{
        for column in 1...8{
            arrayOfFigures.append( funct(row, column))
        }
    }
    return arrayOfFigures
}

var arrayOfFigures = createFigures { (a, b) -> (Chess) in
    var figure = (Chess)(name: .bishop, color: .whiteFigure, location : (a,b))
    switch (a,b) {
    case (1,1),(1,8),(2,1),(2,8):
        figure =  a == 1 ? (Chess)(name: .bishop, color: .whiteFigure, location : (a,b)) :
                           (Chess)(name: .bishop, color: .blackFigure, location : (8,b))
        
    case (1,2),(1,7),(2,2),(2,7):
      
        figure =  a == 1 ? (Chess)(name: .knight, color: .whiteFigure, location : (a,b)) :
                           (Chess)(name: .knight, color: .blackFigure, location : (8,b))
    
    case (1,3),(1,6),(2,3),(2,6):
        figure =  a == 1 ? (Chess)(name: .rook, color: .whiteFigure, location : (a,b))   :
                           (Chess)(name: .rook, color: .blackFigure, location : (8,b))
        
    case (1,4),(2,4):
        figure = a == 1 ?  (Chess)(name: .king , color: .whiteFigure, location:(a,b))    :
                           (Chess)(name: .king , color: .blackFigure, location:(8,b))
        
    case (1,5),(2,5):
        figure = a == 1 ?  (Chess)(name: .queen, color: .whiteFigure, location : (a,b))  :
                           (Chess)(name: .queen, color: .blackFigure, location : (8,b))
        
    default: break
    }
    return figure
}


func printBoardWithFihure (array : [Chess]){
for row in 1...8{
    var cell = String()
    for column in 1...8{
        var count = 0
        for figure in array{
            if figure.location == (row,column) {
                count += 1
                switch figure.name {
                case   .queen : if figure.color.rawValue == "White color"{
                    cell.append("\u{2655}")
                } else {
                     cell += "\u{265B}"
                    }
                case   .king : if figure.color.rawValue == "White color"{
                    cell += "\u{2654}"
                } else {
                    cell += "\u{265A}"
                    }
                case   .bishop : if figure.color.rawValue == "White color"{
                    cell.append("\u{2656}")
                } else {
                    cell += "\u{265C}"
                    }
                case   .knight : if figure.color.rawValue == "White color"{
                    cell += "\u{2658}"
                } else {
                    cell += "\u{265E}"
                    }
                case   .rook : if figure.color.rawValue == "White color"{
                    cell += "\u{2657}"
                } else {
                    cell += "\u{265d}"
                    }
                case   .pawn : if figure.color.rawValue == "White color"{
                    cell += "\u{2659}"
                } else {
                    cell += "\u{265F}"
                    }
                default: break
                }
            }
        }
        if count == 0 {
            if (row + column)%2 == 0{
                   cell += "\u{25FE}"
            } else {
                   cell += "\u{25FD}"
            }
        }
        count = 0
    }
    print(cell)
    cell = String()
    }
}

func moveFigure (oldArray : [Chess],fromPoint: (Int,Int), toPoint :(Int,Int)) -> [Chess]{
    var array = [Chess]()
    var count = 0
    switch (toPoint.0, toPoint.1,fromPoint.0,fromPoint.1) {
    case (1...8,1...8,1...8,1...8):
    
         for i in oldArray{
            if i.location == toPoint{
                print("The cell\(toPoint.0,toPoint.1) is busy")
                return oldArray
            }
            if i.location == fromPoint {
                 count = count + 1
                  let newFigure = (Chess)(name: i.name, color: i.color, location : (toPoint.0,toPoint.1))
                array.append(newFigure)
                print("\(i.color) \(i.name) from point \(fromPoint) =  go to new point \(toPoint)")
            } else {
                array.append(i)
            }
        }
         
         if count == 0 {
            print("figure not found.The cell\(fromPoint.0,fromPoint.1) is empty")
            return oldArray
         } else {
            return array
        }
    default:  print("you can not do this move from \(fromPoint) to \(toPoint). chess board 8x8")
    return oldArray
    }
}

var arrayOfPawn = createPawn()
var arrayForBeginGame = arrayOfFigures + arrayOfPawn
var arrayOfGame = [Chess]()
printBoardWithFihure(array: arrayForBeginGame)
print("-------------------")

arrayOfGame = moveFigure(oldArray: arrayForBeginGame, fromPoint: (1,5), toPoint: (5,6))

printBoardWithFihure(array: arrayOfGame)

arrayOfGame = moveFigure(oldArray: arrayOfGame, fromPoint: (1,1), toPoint: (4,4))

printBoardWithFihure(array: arrayOfGame)

arrayOfGame = moveFigure(oldArray: arrayOfGame, fromPoint: (4,3), toPoint: (6,3))

printBoardWithFihure(array: arrayOfGame)

arrayOfGame = moveFigure(oldArray: arrayOfGame, fromPoint: (2,2), toPoint: (2,3))

arrayOfGame = moveFigure(oldArray: arrayOfGame, fromPoint: (4,5), toPoint: (6,3))








