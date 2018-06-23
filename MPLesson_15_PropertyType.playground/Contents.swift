//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

import Foundation

/*
1. Создать структуру “Описание файла” содержащую свойства:
- путь к файлу
- путь к папке, содержащей этот файл
- имя файла
- максимальный размер файла на диске

- тип файла (скрытый или нет)
- содержимое файла (можно просто симулировать контент)

Главная задача - это использовать правильные свойства там, где нужно, чтобы не пришлось хранить одни и те же данные в разных местах и т.д. и т.п.
*/

struct DescriptionOfFile {
    static let maxSize = 1024
    var path      : String
    var available : Bool
    lazy var contentOfFile = "Content of file"
    var nameOfFile : String? {
        get {
            let components = path.components(separatedBy: "/")
            if components.count > 0 {
                return components.last
            }
            return nil
        }
    
    }
    var pathToFolder : String? {
        get {
            var components = path.components(separatedBy: "/")
                if components.count > 0{
                    components.removeLast()
                    return components.joined(separator: "/")
                }
            return nil
        }
      
    }
    init(path : String, available: Bool) {
        self.path = path
        self.available = available
    }

}

var file = DescriptionOfFile(path: "/Users/maksimponarou/Desktop/Closures.playground", available: true)

if file.nameOfFile != nil && file.pathToFolder != nil {

    print("name of file = \(file.nameOfFile!) ,file is open? =  \(file.available) , path to folder = \(file.pathToFolder!) , path to file = \(file.path)")

}

//2. Создайте энум, который будет представлять некую цветовую гамму. Этот энум должен быть типа Int и как raw значение должен иметь соответствующее 3 байтное представление цвета. Добавьте в этот энум 3 свойства типа: количество цветов в гамме, начальный цвет и конечный цвет.

enum Color : Int{
    
    static let count = 3
    static let startColor = Color.Beige
    static let endColor = Color.Peru
    
    case Peru  = 0xCD853F
    case Brown = 0xA52A2A
    case Beige = 0xF5F5DC
    
}

Color.count

/*
3. Создайте класс человек, который будет содержать имя, фамилию, возраст, рост и вес. Добавьте несколько свойств непосредственно этому классу чтобы контролировать:
- минимальный и максимальный возраст каждого объекта
- минимальную и максимальную длину имени и фамилии
- минимально возможный рост и вес
- самое интересное, создайте свойство, которое будет содержать количество созданных объектов этого класса
*/

class Human {
    
    static let maxMinAge    = (minAge   : 5, maxAge   :100)
    static let maxMinLength = (minLength: 1, maxLength:  8)
    static let minWeight = 10
    static let minHeight = 50
    static var countOfHuman = 0
    
    var firstName : String{
        didSet{
            if firstName.count < Human.maxMinLength.minLength && firstName.count > Human.maxMinLength.maxLength{
                firstName = oldValue
            }
        }
    }
    var lastName  : String{
        didSet{
            if lastName.count < Human.maxMinLength.minLength && lastName.count > Human.maxMinLength.maxLength{
                lastName = oldValue
            }
        }
    }
    
    var age       : Int{
        didSet{
            if age > Human.maxMinAge.maxAge && age < Human.maxMinAge.minAge{
                age = oldValue
            }
        }
    }
    var height    : Int{
        didSet{
            if  height < Human.minHeight {
                height = oldValue
            }
        }
    }
    
    var weight    : Int{
        didSet{
            if  weight < Human.minWeight {
                weight = oldValue
            }
            
        }
    }
    
    init(firstName : String, lastName: String, age : Int, height : Int, weight : Int) {
        self.firstName = firstName
        self.lastName  = lastName
        self.age = age
        self.height = height
        self.weight = weight
        Human.countOfHuman += 1
        }
}

var max  = Human(firstName: "Max", lastName: "Panamarou", age: 23, height: 186, weight: 15)
var vika = Human(firstName: "Vika", lastName: "Orly", age: 22, height: 167, weight: 15)

max.height = 6

max.height

Human.countOfHuman


