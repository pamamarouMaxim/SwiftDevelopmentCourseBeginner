//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Рассмотрим такую ситуацию: есть семья - папа, мама и дети.
//Папа глава семьи, у него есть Мама, Мама контролирует детей, т.е. иерархия: Папа - Мама - Дети, Дети на одном уровне.
//Дети могут вызывать друг друга и они могут искать пути, как общаться с другими Детьми, например говорить "дай игрушку", спрашивать Маму: "Мама, дай конфетку", общаться с Папой: "Папа, купи игрушку".
//Вся эта иерархия лежит в объекте класса Семья, у которого есть методы, например распечатать всю Семью, т.е. метод вернёт массив всех членов Семьи.
//У Папы есть 3 кложера (closures) - 1. когда он обращается к Семье - распечатать всю Семью, 2. распечатать Маму, 3. распечатать всех Детей.
//Создать всю иерархию со связями. При выходе из зоны видимости все объекты должны быть уничтожены. Используем Command-Line Tool.


class Family{
    var father : Father!
    var mother : Mother!
    var child  = [Child]()
    
    init(father : Father, mother : Mother, child : [Child]) {
        self.father = father
        self.mother = mother
        self.child  = child
    }
    
    lazy var printFamily = {
        
        [unowned self] in
        var child = self.nameOfChild()
        print("father = \(self.father.name), mother = \(self.mother.name), child = \(child)")
        
    }
    
    func nameOfChild() -> (String) {
        var names = String()
        for i in self.child{
            names += i.name + ","
        }
        return names
    }
    
    deinit {
        print("family class bye")
    }
}

class Human {
    var name : String
    
    init(name: String) {
        self.name = name
    }
}

class Father : Human{
    var mother : Mother
    
    init(mother : Mother, name : String) {
        self.mother = mother
        super.init(name: name)
    }
    
    lazy var printMother : () -> () = {
        [unowned self] in
        print("Mother = \(self.mother.name)")
        
    }
    
    lazy var printChild = {
        [unowned self] in
        self.mother.printChild()
    }
  
    func printFamily(){
        self.printChild
        self.printMother
    }
    
    deinit {
        print("Father \(self.name) bye")
    }
    
}

class Mother : Human{
    var child = [Child]()
    
    func printChild(){
        var childs = String()
        for i in self.child{
            childs = childs + i.name + ","
        }
        print("Childs = \(childs)")
    }
    
    deinit {
        print("Mother \(self.name) bye")
    }
}

class Child : Human{
    unowned var father: Father
    unowned var mother: Mother
    
    init(father : Father, mother : Mother, name : String) {
        self.mother = mother
        self.father = father
        super.init(name: name)
    }
    
    func buyToy(){
        print("Dad  \(self.father.name), buy this toy for me, said \(self.name) ")
    }
    func giveCandy(){
        print("Mom  \(self.mother.name), give this candy for me, said \(self.name) ")
    }
    func giveToy(childSecond : Child){
        if self !== childSecond {
              print("\(self.name) took the toy from \(childSecond.name)")
        }
    }
    deinit {
        print("Child \(self.name) bye")
    }

}


var task = true

if task{

let mother = Mother(name: "Alex")
let father = Father(mother: mother, name: "Jack")
let childOne = Child(father: father, mother: mother, name: "David")
let childTwo = Child(father: father, mother: mother, name: "Muchamed")
let childThree = Child(father: father, mother: mother, name: "Lucifer")

mother.child = [childOne,childTwo,childThree]
    
let family = Family(father: father, mother: mother, child: [childOne,childTwo,childThree])
    
family.printFamily()
father.printMother()
father.printChild()

childOne.giveToy(childSecond: childTwo)

}

