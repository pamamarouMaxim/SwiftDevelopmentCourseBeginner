//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//           Lesson8
//          Task 8.1
//1. Создайте дикшинари как журнал студентов, где имя и фамилия студента это ключ, а оценка за контрольную значение. Некоторым студентам повысьте оценки - они пересдали. Потом добавьте парочку студентов, так как их только что перевели к вам в группу. А потом несколько удалите, так как они от вас ушли :(
//
//После всех этих перетрубаций посчитайте общий бал группы и средний бал


var journalOfStudents = ["Alesia": 6, "Kostia" : 7 , "Max" : 8 , "Kate" : 8 , "Olga" : 9]

journalOfStudents["Alesia"] = 8
journalOfStudents["Max"] = 9

journalOfStudents["Max1"] = 8
journalOfStudents["Max2"] = 9
journalOfStudents["Max3"] = 3
journalOfStudents["Max4"] = 3

journalOfStudents.removeValue(forKey: "Max4")

var summ : Double = 0

journalOfStudents["Max3"] = 10

for key in journalOfStudents.keys {
    if let keyForDictionamry = journalOfStudents[key]{
        print("key = \(key) , value = \(keyForDictionamry)")
        summ += Double(keyForDictionamry)
    }
}
var averageMark = summ / Double(journalOfStudents.count)
print("summ = \(summ) average mark = \(averageMark)")

//             Task 9.2

//2. Создать дикшинари дни в месяцах, где месяц это ключ, а количество дней - значение.
//В цикле выведите ключ-значение попарно, причем один раз выведите через тюплы, а другой раз пройдитесь по массиву ключей и для каждого из них доставайте значения.

let namesMonths = ["january":  31,
                   "february": 28,
                   "march":    31,
                   "april":    30,
                   "may":      31,
                   "june":     30,
                   "jule":     31,
                   "august":   30,
                   "september":31,
                   "october":  30,
                   "november": 31,
                   "december": 30]

for (key,value) in namesMonths{
    print("month = \(key) days : \(value)")
}

for key in namesMonths.keys{
    if let value = namesMonths[key] {
       print("month = \(key) days : \(value)")
    }
}

//           Task 9.3

//3. Создать дикшинари , в которой ключ это адрес шахматной клетки (пример: a5, b3, g8), а значение это Bool. Если у клетки белый цвет, то значение true, а если черный - false. Выведите дикшинари в печать и убедитесь что все правильно.
//
//Рекомендация: постарайтесь все сделать используя вложенный цикл (объяснение в уроке).


var dictionaryOfCell = [String:Bool]()
var arrayOfLetter = ["a","b","c","d","i","f","j","k"]


for x in 0..<arrayOfLetter.count{
    for y in 0..<arrayOfLetter.count{
        let key = arrayOfLetter[x] + String(y + 1)
        if (x + y + 2)%2 == 0 {
            dictionaryOfCell[key] = true
        } else {
            dictionaryOfCell[key] = false
        }
    }
}

var countOfBlackCell = 0
var countOfWhiteCell = 0

for (key,value) in dictionaryOfCell{

    if value == false{
        countOfBlackCell += 1
        print("\(key) is black cell")
    } else{
        countOfWhiteCell += 1
         print("\(key) is white cell")
    }
    
}

print("chess board consist of \(countOfBlackCell) black cells and \(countOfWhiteCell) white cells")



