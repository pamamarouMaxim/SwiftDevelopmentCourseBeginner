//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//1. Создать строку произвольного текста, минимум 200 символов. Используя цикл и оператор свитч посчитать количество гласных, согласных, цифр и символов.

//               Lesson 9
//               Task 9.1

let textOfLesson = "qazxsyfjytfedfcrueqwctvwbyuqvcyvuinuctu c ivnovyomibmio,vrr/]';p,cowimwocfmq" +
                   "1824cb49ryb743x1bfb63f1sbyfbys1uy4fin1fyg1 bfz,.q;c;lc;wec;oerfer nkfeinrcoi" +
                   "8327f8723bg287t6t7ep18bxe3812nuce8u1283cru 28crby2p4otyc9p8tu8n4uct4m8muc4tu" +
                   "tf4cfy38b4cfu38u4boc8pbo38buo83uco3c8YB 88y3og8cy3o8byb3coyqv3yxiq3ybfyqignngmx"

var vowelsLetters  = 0
var cognateLetters = 0
var symbolsInText  = 0
var numeralInText  = 0

let vowels   = "eyuioa"
let numerals = "1234567890"
let cognate  = "wrtplkhgfdszxcvbnm"

for i in textOfLesson{

    let char = String(i).lowercased()
    switch char {
    case _ where vowels.contains(char)  : vowelsLetters  += 1 ;
    case _ where numerals.contains(char): numeralInText  += 1
    case _ where cognate.contains(char) : cognateLetters += 1
    default: symbolsInText += 1
    }
}
print("vowels = \(vowelsLetters)\nnumerals = \(numeralInText)\nsymbols = \(symbolsInText)\ncognate = \(cognateLetters)")

var summ = vowelsLetters + cognateLetters + symbolsInText + numeralInText

if summ == textOfLesson.count {
    print("summ = \(summ) task one Done!")
}

//            Task 9.2

//2. Создайте свитч который принимает возраст человека и выводит описание жизненного этапа

let ageOfPerson = 23

switch ageOfPerson {
case 0..<5  : print("Младенец")
case 5..<10 : print("Ребенок")
case 10..<15: print("Подросток")
case 15..<19: print("Юноша")
case 19..<24: print("Парень")
case 24..<44: print("Мужчина")
case 44...70 : print("Сэр")
default:   print("Ты кто?")    
}

//            Task 9.3

//3. У вас есть имя отчество и фамилия студента (русские буквы). Имя начинается с А или О, то обращайтесь к студенту по имени, если же нет, то если у него отчество начинается на В или Д, то обращайтесь к нему по имени и отчеству, если же опять нет, то в случае если фамилия начинается с Е или З, то обращайтесь к нему только по фамилии. В противном случае обращайтесь к нему по полному имени.

let student = (nameOfStudent : "maxim" , sonameOfStudent : "panamarou", patronymic : "aliaxandrovich")

switch student {
    case (let name, _ , _) where name.hasPrefix("o")  || name.hasPrefix("a")   : print("hello \(name)")
    case (_, _ , let patr) where patr.hasPrefix("v")  || patr.hasPrefix("b")   : print("hello \(patr)")
    case (_,let soname, _) where soname.hasPrefix("e") || soname.hasPrefix("z"): print("hello \(soname)")
    
default:print("student name=\(student.nameOfStudent),soname=\(student.sonameOfStudent),patronymic = \(student.patronymic)")
}

//           Task 9.4

//4. Представьте что вы играете в морской бои и у вас осталось некоторое количество кораблей на поле 10Х10 (можно буквы и цифры, а можно только цифры). Вы должны создать свитч, который примет тюпл с координатой и выдаст один из вариантов: мимо, ранил.

let firstShip  = (x:3 ,y: 4 , w : 3, h : 4)
let secondShip = (x:4 ,y: 4 , w : 1, h : 2)

let ships =  [firstShip, secondShip ]

let shot = (vertical : 3, horizontal : 4)

func seaBattle(_ arrayOfShip :[(Int,Int,Int,Int)],shot : (Int,Int)) -> Bool{
    var goal = true
    for ship in arrayOfShip {
        switch shot {
        case (ship.0...(ship.0 + ship.2 - 1),ship.1...(ship.1 + ship.3 - 1)): print("wounded");goal = true
        default:print("missed");goal = false 
        }
    }
    return goal
}

seaBattle(ships, shot: shot)

