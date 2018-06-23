//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
class Student {
    var firstName : String
    var lastName  : String
    var fullName  : String {
        return firstName + lastName
    }
    
    init() {
        self.firstName = ""
        self.lastName  = ""
    }
}

class Student2 {
    var firstName = ""
    var lastName  = ""
     var fullName  : String {
        return firstName + lastName
    }
}
class Student3 {
    var firstName : String
    var lastName  : String
    var fullName  : String {
        return firstName + lastName
    }
    
    init(firstName : String , lastName : String ) {
        self.firstName = firstName
        self.lastName  = lastName
    }
}

let student1 = Student()
let student2 = Student2()
let student3 = Student3(firstName: "a", lastName: "b")

class Student4{
    var middleName : String?
}

class Student5{
    let maxAge  : Int
    
        init(){
            maxAge = 100
        
    }
}


/*
class Student6 : Student5{
  
    override init(){
        maxAge = 100
        
    }
}
*/

struct Student7 {
    var firstName : String
    
    init() {
        firstName = "Max"
    }
}

var stud4 = Student4()

var stud5 = Student5()

var stud7 = Student7()

//     до этого были дисигнейтед инициализаторы
//////////////////

class Human{
    var weight : Int
    var age    : Int
    
    init(weight : Int, age : Int) { // designetad конструктор
        self.weight = weight
        self.age    = age
    }
    
    convenience init(age : Int){
        self.init(weight: 4, age: age) // convenience init
    }
    
    convenience init(weight : Int){
        self.init(weight: weight, age: 5) // convenience init
    }
    
    convenience init(){
        self.init(weight: 3) // convenience init
    }
    
    func test()  {
        
    }
}

let h1 = Human(weight: 10, age: 10)
let h2 = Human(weight: 20)
let h3 = Human(age: 30)
let h4 = Human() // вместо let h1 = Human(weight: 0, age: 0)
let h5 = Human()
// convenience init используется когда мы не знаем какой-либо параметр и объявляем его по дефолту . один конструктор вызывает второй ;в конце цепочки или напрямую convenience заканчивается designetad; convenience - внутри класса; convenience может выхывать convenience (по цепочке)

// designetad конструктор - задача установить все property

class Human1 : Human{
    var name : String
    var lastName : String
        init(name: String, lastName: String){
        self.name = name
        self.lastName = lastName
        super.init(weight: 10, age: 10)  // вызов только disign
        test()
        self.weight = 100
        test()
        self.age = 23
        //self.weight = 100  test() можно только после инициализации super.init  (decignated of parant class
    }
    
    // переопреде дисигн родмтедя что бы подбзоваться его дисигн и конвинь
    /*
    override init(weight: Int, age: Int) {
        self.name = ""
        self.lastName = ""
        super.init(weight: weight, age: age)
    }
    */
    
     // что бы не переопределять все родительские override init в  override convenience init
    override convenience init(weight: Int, age: Int) {
        self.init(firstname : "Olga")
        self.weight = weight
        self.age = age
    }
    
    convenience init(firstname : String){
        self.init(name: firstname, lastName: "Panamarou123")
    }
}

let human1 = Human1(firstname: "Max123")

//                                        PART TWO


class Doctor : Human1{
    
    var fieldOfStudy : String = ""
    /*
     
     1) если нет своего дисигнейтед то наследуем и димигнейтед и сонвиньенс родителя
     
    init(fieldOfStudy :String) {
        self.fieldOfStudy = fieldOfStudy
        super.init(name: "Max", lastName: "Panamarou")    // 2) определяя дисигнейтед мы тебяем методы родителя и димигнейтед и конвиньенс
     }
     */
    /*
        convenience init(fieldOfStudy :String){
        self.init(firstname : "Max")   // 3) так как нет своего дисигнейтед то вызываем метод родитедя ' как свой метод ' и димигнейтед и сонвиньенс
     
        self.fieldOfStudy = fieldOfStudy
        }
     
 */
    //  Можно записать свой дисегнейтед если переопределить все дисигнейтед родителя ( в данном случае один )
    // тогда будут унаследованы все дисигнейтед и конвиньенс родителя
    
    init(fieldOfStudy :String) {
        self.fieldOfStudy = fieldOfStudy
        super.init(name: "Max", lastName: "Panamarou")
    }
    
    override init(name: String, lastName: String) {
        self.fieldOfStudy = "Health"
        super.init(name: name,lastName: lastName)
    }
    
    //  тк  human 1 имеет уже два дисиг ( один свой и один переопределенный то нужно переопределить еще один дисигн родитедя)
    /*
    override init(weight: Int, age: Int) {
        self.fieldOfStudy = ""
        super.init(weight: weight, age: age)
    }
    */
 // тк human 1 переопределил род метод Human как   override convenience init то переопределять нам его не надо тк это не дисигнейтед
    
}

var st = Human1()

*/


//                                        PART Three

/*

import Foundation

class Human{
    var weight : Int
    var age    : Int
    
    init(weight : Int, age : Int) { // designetad конструктор
        self.weight = weight
        self.age    = age
    }
    
    convenience init(age : Int){
        self.init(weight: 4, age: age) // convenience init
    }
    
    convenience init(weight : Int){
        self.init(weight: weight, age: 5) // convenience init
    }
    
    convenience init(){
        self.init(weight: 3) // convenience init
    }
    
    func test()  {}
    
    deinit {
        print("BestFriend is dead")
    }
}

//           FAILABLE INIT ( OPTIONAL)

enum Color : Int{
    case Black
    case White
    
    init?(value : Int){
        switch value {
        case 0: self = .Black
        case 1: self = .White
        default: return nil
        }
    }
}

let a = Color(value: 20)
let b = Color(rawValue: 2)


struct Size {
    var weight : Int
    var height : Int
    
    init?(weight : Int,height : Int ) {
        if weight < 0 || height < 0 {
            return nil
        }
        
        self.height = height
        self.weight = weight
    }
}
/*
class Friends {
    var name : String! // или ""
    
    init?(name : String) {
        if name.isEmpty{
            return nil
        }
        self.name = name
    }
}
*/
// при наследовании
class Friends : Human{
    var name : String! // или ""
    
   // let skin : Color = .Black
    let skin : Color = .White
        /*
    {
        let random = Int(arc4random_uniform(2))
        return Color(random)!
    }
 */
    
    init?(name : String) {
        self.name = name
        super.init(weight: 0, age: 0)
      //  self.skin = randomColor()
        if name.isEmpty{
            return nil
        }
        
    }
    
    required init(){                // значит в дочернем классе требуется переопределить
        name = "Hi"
      //  self.skin = randomColor()
        super.init(weight: 0, age: 0)
    }
    
    deinit {
        print("BestFriend is dead")
    }
    /*
    func randomColor() -> Color {
        let random = Int(arc4random_uniform(2))
        return Color(random)!
    }
 */
}

//let fr = Friends(name: "")

class BestFriend : Friends {
    override init(name: String) {
        if name.isEmpty{
            super.init()
        } else {
            super.init(name: name)!
        }
    }
    
    required init() {
         super.init()
    }
    
    deinit {
        print("BestFriend is dead")
    }
}

struct Test {
    var test : BestFriend? = BestFriend()
}

var test : Test? = Test()
test?.test = nil

*/
//        Деинициализвция


// deinit выз перед тем как об будет уничтожен


class Bank {
    static var coinsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
        print("PlayerOne has left the game")
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
// Prints "A new player has joined the game with 100 coins"
print("There are now \(Bank.coinsInBank) coins left in the bank")
// Prints "There are now 9900 coins left in the bank"

playerOne!.win(coins: 2_000)
print("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
// Prints "PlayerOne won 2000 coins & now has 2100 coins"
print("The bank now only has \(Bank.coinsInBank) coins left")
// Prints "The bank now only has 7900 coins left"

playerOne = nil

// Prints "PlayerOne has left the game"
print("The bank now has \(Bank.coinsInBank) coins")
// Prints "The bank now has 10000 coins"

