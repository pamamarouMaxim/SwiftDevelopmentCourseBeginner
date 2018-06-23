//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//Шахматная доска
//
//1. Создайте тип шахматная доска.
//
//2. Добавьте сабскрипт, который выдает цвет клетки по координате клетки (буква и цифра).
//
//3. Если юзер ошибся координатами - выдавайте нил
//

struct BoardOfChess{
    
    var cell = [String : String]()
    
    subscript(column: String,row: Int) -> String?{
        
        if row == 0 || row > 9 {
            return nil
        }
        let alphabet = "abcdifgh"
        var numberOfLetter = 0
        var number = 0
        for char in alphabet{
            numberOfLetter += 1
            if String(char) == column.lowercased(){
                number += 1
                break
            }
        }
        if number == 0 {
            return nil
        }
        return (numberOfLetter + row)%2 > 0 ? colorOfCell.White.rawValue : colorOfCell.Black.rawValue
    }
    
    enum colorOfCell : String {
        case White = "Cell is white"
        case Black = "Cell is black"
    }
}

var cellChess = BoardOfChess()

cellChess["a",1]
cellChess["h",8]
cellChess["b",55]
cellChess["z",1]
cellChess["a",99]


//Крестики нолики
//
//1. Создать тип, представляющий собой поле для игры в крестики нолики
//На каждой клетке может быть только одно из значений: Пусто, Крестик, Нолик
//Добавьте возможность красиво распечатывать поле
//
//2. Добавьте сабскрипт, который устанавливает значение клетки по ряду и столбцу,
//причем вы должны следить за тем, чтобы программа не падала если будет введен не существующий ряд или столбец.
//
//3. Также следите за тем, чтобы нельзя было устанавливать крестик либо нолик туда, где они уже что-то есть. Добавьте метод очистки поля.
//
//4. Если хотите, добавте алгоритм, который вычислит победителя

struct Field{
    
    static let rows    = 1...3
    
    static let columns = 1...3
    
    enum Cell : String{
        case Empty = "⬜"
        case USA  = "🇺🇸"
        case Russia = "🇷🇺"
    }
    
    var dict = [Int:String]()
    
    mutating func createField(){
       
        for i in Field.rows{
            for z in Field.columns{
                self.dict[i*10 + z] = Field.Cell.Empty.rawValue
            }
        }
    }
    
    func printField(){
        for i in Field.rows{
            var row = String()
            for z in Field.columns{
                if let string = self.dict[i*10 + z]{
                     row += string
                }
            }
            print("\(row)")
        }
    }
    
    subscript(row : Int, column: Int) -> String? {
        get{
            
            let opt = self.dict[row*10 + column]
            
            return opt == nil ? "Enter other location" : opt
        }
        set{
            
            var add = Bool()
                for i in Field.rows{
                    for z in Field.columns{
                            if self.dict[i*10 + z] == Field.Cell.Empty.rawValue{
                                add = true
                            }
                    }
                }
            if add{
                let key = row*10 + column
                if let new = newValue{
                    if new != Field.Cell.Empty.rawValue && self.dict[key] == Field.Cell.Empty.rawValue {
                        self.dict[key] = newValue
                        print("made a move to \(row,column)")
                    } else {
                        print("make another move")
                    }
                }
            } else {
                print("Draw !!!")
                self.createField()
            }
        
        }
    }
    
}

var cell = Field(dict: [Int : String]())

cell.createField()
cell.printField()
cell.dict



cell[1,1] = Field.Cell.Russia.rawValue
cell.printField()
cell[1,2] = Field.Cell.USA.rawValue
cell.printField()
cell[3,3] = Field.Cell.Russia.rawValue
cell.printField()
cell[2,2] = Field.Cell.USA.rawValue
cell.printField()
cell[3,2] = Field.Cell.Russia.rawValue
cell.printField()
cell[3,1] = Field.Cell.USA.rawValue
cell.printField()
cell[1,3] = Field.Cell.Russia.rawValue
cell.printField()
cell[2,3] = Field.Cell.USA.rawValue
cell.printField()
cell[2,1] = Field.Cell.Russia.rawValue
cell.printField()

cell[2,1] = Field.Cell.Russia.rawValue

cell.createField()
cell.printField()







