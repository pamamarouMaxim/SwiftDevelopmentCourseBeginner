//: Playground - noun: a place where people can play

import UIKit

//1. У нас есть базовый клас "Артист" и у него есть имя и фамилия. И есть метод "Выступление". У каждого артиста должно быть свое выступление: танцор танцует, певец поет и тд. А для художника, что бы вы не пытались ставить, пусть он ставит что-то свое (пусть меняет имя на свое артистическое). Когда вызываем метод "выступление" показать в консоле имя и фамилию артиста и собственно само выступление.
//Полиморфизм используем для артистов. Положить их всех в массив, пройтись по нему и вызвать их метод "выступление"

var str = "Hello, playground"

class Artist{
    var firstName : String
    var lastName  : String
    
    func show() -> String {
        return firstName + " " + lastName
    }
    
    init(firstName : String,lastName : String) {
        self.firstName = firstName
        self.lastName  = lastName
    }
    
}

class Dancer : Artist{
    override func show() -> String {
        return super.show() + " dance"
    }
}

class Songer : Artist{
    override func show() -> String {
        return super.show() + " song"
    }
}

class Actor : Artist{
    override func show() -> String {
        return super.show() + " film"
    }
}

class Painter : Artist{
    
    override var firstName : String{
        set{
            
        }
        get{
            return "Picasso"
        }
    }
    
    override func show() -> String {
        return super.show() + " picture"
    }
}

let dancer = Dancer(firstName: "Migel", lastName: "Galustian")
let songer = Songer(firstName: "Pink", lastName: "Greenadia")
let actor  = Actor(firstName: "Danila", lastName: "Kozlovski")
let painter  = Painter(firstName: "Oleg", lastName: "Da li")

let artists = [dancer,songer,actor,painter]

for art in artists{
    print("\(art.show())")
}


//2. Создать базовый клас "транспортное средство" и добавить три разных проперти: скорость, вместимость и стоимость одной перевозки (computed). Создайте несколько дочерних класов и переопределите их компютед проперти у всех. Создайте класс самолет, корабль, вертолет, машина и у каждого по одному объекту. В компютед пропертис каждого класса напишите свои значения скорости, вместимости, стоимости перевозки. + у вас должен быть свой метод который считает сколько уйдет денег и времени что бы перевести из пункта А в пункт В определенное количество людей с использованимем наших транспортных средств. Вывести в кольсоль результат (как быстро сможем перевести, стоимость, количество перевозок).
//Используем полиморфизм


class Vichle{
    
    let distance = 500
    let countOfPeople = 400
    
    var nameOfVichle : String{
        return "vichle"
    }
    
    var speed : Int {
      return 1
    }
    var costOfTrip : Int {
        return 1
    }
    var capacity : Int {
        return 1
    }
    
    func move() -> [String : Double]{
        
        var dict = [String : Double]()
        let trip =  Double(countOfPeople)/Double(self.capacity) >  Double(countOfPeople/self.capacity) ?  2*countOfPeople/self.capacity + 1:       2*countOfPeople/self.capacity - 1
        
        let countOfTrip = countOfPeople/self.capacity <= 1 ? 1 : trip
        
        dict["timeOfTrip"]  = Double(countOfTrip)*Double(distance)/Double(self.speed)
        dict["costOfTrip"]  = Double(self.costOfTrip*countOfTrip)
        dict["countOfTrip"] = Double(countOfTrip)
        
        return dict
    }
    
    
}

class Ship : Vichle{
    
    override var nameOfVichle : String{
        return "Ship"
    }
    
    override var speed : Int {
        return 15
    }
    override var costOfTrip : Int {
        return 5
    }
    override var capacity : Int {
        return 100
    }
}

class Plane : Vichle{
    
    override var nameOfVichle : String{
        return "Plane"
    }
    override var speed : Int {
        return 700
    }
    override var costOfTrip : Int {
        return 50
    }
    override var capacity : Int {
        return 100
    }
}

class Bus : Vichle{
    
    override var nameOfVichle : String{
        return "Bus"
    }
    
    override var speed : Int {
        return 80
    }
    override var costOfTrip : Int {
        return 3
    }
    override var capacity : Int {
        return 50
    }
}

class Car : Vichle{
    
    override var nameOfVichle : String{
        return "Car"
    }
    override var speed : Int {
        return 100
    }
    override var costOfTrip : Int {
        return 10
    }
    override var capacity : Int {
        return 5
    }
}


let car = Car()
let plane = Plane()
let ship = Ship()
let bus = Bus()

let arrayOfVichle = [car,plane,ship,bus]

for vichle in arrayOfVichle{
    let dict = vichle.move()
    print("\(vichle.nameOfVichle) time Of trip hour = \(dict["timeOfTrip"]!),cost Of trip = \(dict["costOfTrip"]!),count Of trip = \(dict["countOfTrip"]!) ")
}



