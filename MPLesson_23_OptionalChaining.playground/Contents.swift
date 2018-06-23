//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Сегодня будем строить свою небольшую социальную сеть.
//1. Сделать класс Человек, у этого класса будут проперти Папа, Мама, Братья, Сестры (всё опционально).
//Сделать примерно 30 человек, взять одного из них, поставить ему Папу/Маму. Папе и Маме поставить Пап/Мам/Братьев/Сестер. Получится большое дерево иерархии.
//Посчитать, сколько у этого человека двоюродных Братьев, троюродных Сестёр, Теть, Дядь, итд
//2. Все сестры, матери,... должны быть класса Женщина, Папы, братья,... класса Мужчины.
//У Мужчин сделать метод Двигать_диван, у Женщин Дать_указание (двигать_диван). Всё должно работать как и ранее.
//Всех этих людей положить в массив Семья, пройти по массиву посчитать количество Мужчин и Женщин, для каждого Мужчины вызвать метод Двигать_диван, для каждой женщины Дать_указание.
//3. Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
//Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве.
//Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
//Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.
//
//Обязательно используем в заданиях Optional chaining и Type casting

class Human{
    var father : Father?
    var mother : Mother?
    var sister : [Sister]?
    var brother: [Brother]?
    var animal : [Animal]?
    
    deinit {
        print("oOo")
    }
}

class Male : Human{
    func moveSofa(){
        print("Moved bad")
    }
}

class Female : Human{
    func sayMoveSofa(){
        print("Saed to move bad")
    }
}

class Brother : Male{
    
}

class Sister : Female{
    
}

class Father : Male{
    
}

class Mother : Female{
    
}

class Animal{
    
    var scream : String{
        return "A-A-A"
    }
    
    func screamOfAnimal() {
        print("\(self.scream)")
    }
}

class Dog : Animal{
    override var scream: String{
        return "Gav - gav -gav"
    }
}

class Cat : Animal{
    override var scream: String{
        return "Miay - miay - miam"
    }
}

class Fox : Animal{
    override var scream: String{
        return "What does the fox say ? ? ?"
    }
}

//                  TASK 1

// it is Human

var human17 = Human()

// father's parents

let human1  = Father()
let human2  = Mother()

// aunt and uncle of human17 from father

let human3  = Sister()
let human4  = Sister()
let human5  = Brother()
let human6  = Brother()

// other people

let human7  = Sister()
let human8  = Sister()
let human9  = Sister()
let human10 = Sister()

// brothers and sisters of human 17
let human11 = Brother()
let human12 = Brother()
let human13 = Brother()
let human14 = Sister()
let human15 = Sister()
let human16 = Sister()
let human18 = Sister()
let human19 = Sister()

// mother's parents

let human20 = Father()
let human21 = Mother()

// aunt and uncle of human17 from mother

let human22 = Sister()
let human23 = Sister()
let human24 = Brother()

// other people
let human25 = Brother()
let human26 = Brother()
let human27 = Brother()
let human28 = Brother()
let human29 = Brother()
let human30 = Brother()


// Father and mother of Human 17

var father = Father()
var mother = Mother()

father.father = human1
father.mother = human2

father.brother = [human5,human6]
father.sister  = [human3,human4]

mother.father = human20
mother.mother = human21

mother.sister  = [human22,human23]
mother.brother = [human24]

human17.father = father
human17.mother = mother

human17.brother = [human11,human12,human13]
human17.sister  = [human14,human15,human16,human18,human19]

human17.animal = [Dog()]


if let sis = human17.sister?.count{
    print("Count Of sisters = \(sis)")
} else {
    print("Count of sisters = nil")
}

if  (human17.brother?.count) != nil {
    print("Count Of brothers = \(human17.brother!.count)")
} else {
    print("Count of brothers = nil")
}

if true {
    
    var uncle = 0
    var aunt  = 0
    
    if let uncleFather = human17.father?.brother?.count{
        uncle += uncleFather
    }
    if let uncleMother = human17.mother?.brother?.count{
        uncle += uncleMother
    }
    if let auntFather = human17.father?.sister?.count{
        aunt += auntFather
    }
    if let auntMother = human17.mother?.sister?.count{
        aunt += auntMother
    }
    print("Count of uncle = \(uncle), count of aunt = \(aunt)")
}


let arrayOfFamily  = [human1,human2,human3,human4,human5,human6,human7,human8,human9,human10,
                      human11,human12,human13,human14,human15,human16,human18,human19,human20,
                      human21,human22,human23,human24,human25,human26,human27,human28,human29,human30]

for value in arrayOfFamily{
    if let f = value as? Father {
        f.moveSofa()
    }
    if let b = value as? Brother{
        b.moveSofa()
    }
    if let m = value as? Mother{
        m.sayMoveSofa()
    }
    if let s = value as? Sister{
        s.sayMoveSofa()
    }
}


//3. Расширить класс человек, у него будет проперти Домашние_животные. Животные могут быть разные (попугаи, кошки, собаки...) их может быть несколько, может и не быть вообще.
//Раздать некоторым людям домашних животных. Пройти по всему массиву людей. Проверить каждого человека на наличие питомца, если такой есть - добавлять всех животных в массив животных. Посчитать сколько каких животных в этом массиве.
//Вся эта живность должна быть унаследована от класса Животные. У всех животных должен быть метод Издать_звук(крик) и у каждого дочернего класса этот метод переопределён на свой, т.е. каждое животное издаёт свой звук.
//Когда проходим по массиву животных, каждый представитель вида животных должен издать свой звук.


human1.animal = [Dog(),Cat(),Fox()]
human6.animal = [Dog()]
human12.animal = [Dog()]
human16.animal = [Cat(),Fox()]
human19.animal = [Fox()]
human22.animal = [Dog(),Fox()]
human4.animal = [Fox()]

var arrayOfAnimals = [Animal]()


for value in arrayOfFamily{
    if value.animal != nil{
        for animal in value.animal!{
            arrayOfAnimals.append(animal)
        }
    }
}

arrayOfAnimals.count

for animal in arrayOfAnimals{
     // animal.screamOfAnimal()
    
     if let dog = animal as? Dog{
     dog.screamOfAnimal()
     }
     if let cat = animal as? Cat{
     cat.screamOfAnimal()
     }
     if let fox = animal as? Fox{
     fox.screamOfAnimal()
     }
    
}


//////////////////////////////    EXAMPLE      ///////////////////////////

/*
class Adress{
    var street  = "Sennitskaya"
    var number  = "51"
    var city    = "Minsk"
    var country = "Belsrus"
}


class Garage{
    var size = 2
}

class House {
    var rooms = 1
    var adress = Adress()
    var garage : Garage? = Garage()
}

class Car {
    var model = "BMV"
    func start()  {}
}

class Person{
    var cars  : [Car]? = [Car()]
    var house : House? = House()
}

let p = Person()

//p.cars![0]
//p.house!


//p.house!.garage!.size = 4   не верно

p.house?.garage?.size = 4



if let test = p.house?.garage?.size{
    test
}
// установить свойство
if (p.house?.garage?.size = 6) != nil {
    
}

p.house?.garage?.size

// нужно следить за индексом массива
p.cars?[0].model

 // проверка вызвался ли метод

if p.cars?[0].start() != nil {
    print("Yes")
} else {
    print("No")
}


//developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/OptionalChaining.html#//apple_ref/doc/uid/TP40014097-CH21-ID245  работа с dictionary

var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72

//Type Casting

class Symbol{
    
}

class A : Symbol{
    func aa() {}
}

class B : Symbol{
    func bb() {}
}

let array : [Symbol] = [A(),B(),A(),A(),B(),Symbol()]

var aCount = 0
var bCount = 0
var cCount = 0

for value in array{
    if value is A{
        aCount += 1
    }
    if value is B{
        bCount += 1
    }
    if value is Symbol{
        cCount += 1
    }
    if let a = value as? A {
        a.aa()
    }
 
    if let b = value as? B {
        b.bb()
    }
   
}


//AnyObject - только объекты
//Any       - все

import Foundation

let array2 : [AnyObject] = [A(),B(),A(),NSObject()]

let array3 : [Any] = [A(),B(),A(),"hello",5,{() -> () in return}]
*/
