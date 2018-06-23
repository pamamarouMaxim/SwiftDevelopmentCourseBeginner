//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1. Объявить протокол Food, который будет иметь проперти name (только чтение) и метод taste(), который будет выводить текст со вкусовыми ощущениями
//
//2. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол Food. Вам нужно пройтись по сумке, назвать предмет и откусить кусочек. Можете отсортировать продукты до имени. Используйте для этого отдельную функцию, которая принимает массив продуктов
//
//3. Некоторые продукты могут испортиться, если их не положить в холодильник. Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти - expired. У некоторых продуктов замените Food на Storable. Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него. Используйте функцию для вывода продуктов для вывода содержимого холодильника
//
//4. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.
//
//5. Не все, что мы кладем в холодильник, является едой. Поэтому сделайте так, чтобы Storable не наследовался от Food. Мы по прежнему приносим еду домой, но некоторые продукты реализуют теперь 2 протокола. Холодильник принимает только те продукты, которые еще и Storable. функция сортировки должна по прежнему работать.

protocol Food{
    var name : String{get}
    func taste() -> String
}


protocol Storable : Food{
    
    var expired : Bool{get}
    
    var daysToExpire : Int{get}
}

class Milk : Storable{
    var name: String{
        return "Milk"
    }
    var expired: Bool{
        return true
    }
    var daysToExpire : Int{
        return 0}
    func taste() -> String{
        return "Taste milk"
    }
}

class Cheese : Storable{
    var name: String{
        return "Cheese"
    }
    var expired: Bool{
        return false
    }
    var daysToExpire : Int{
        return 50}
    func taste() -> String{
        return "Taste Cheese"
    }
}

class Juise : Storable{
    var name: String{
        return "Juise"
    }
    var expired: Bool{
        return false
    }
    var daysToExpire : Int{
        return 100}
    func taste() -> String{
        return "Taste Juise"
    }
}
class Egg : Food{
    var name: String{
        return "Egg"
    }
    func taste() -> String{
        return "Taste Egg"
    }

}
class Sweets : Food{
    var name: String{
        return "Sweets"
    }
    func taste() -> String{
        return "Taste Sweets"
    }

}
class Bread  : Food{
    var name: String{
        return "Bread"
    }
    func taste() -> String{
        return "Taste Bread"
    }

}

var arrayOfProducts : [Food] = [Milk(),Cheese(),Egg(),Sweets(),Bread(),Juise()]

///2. Все продукты разных типов, которые вы принесли из супермаркета, находятся в сумке (массив) и все, как ни странно, реализуют протокол Food. Вам нужно пройтись по сумке, назвать предмет и откусить кусочек. Можете отсортировать продукты до имени. Используйте для этого отдельную функцию, которая принимает массив продуктов

func sortedProducts(products : [Food]){
    let array = products.sorted { (a, b) -> Bool in
        a.name < b.name
    }
    for value in array{
        print("\(value.name);\(value.taste())")
       
    }
}

sortedProducts(products: arrayOfProducts)
print("_________________________")

//3. Некоторые продукты могут испортиться, если их не положить в холодильник. Создайте новый протокол Storable, он наследуется от протокола Food и содержит еще булевую проперти - expired. У некоторых продуктов замените Food на Storable. Теперь пройдитесь по всем продуктам и, если продукт надо хранить в холодильнике, то перенесите его туда, но только если продукт не испорчен уже, иначе просто избавьтесь от него. Используйте функцию для вывода продуктов для вывода содержимого холодильника
//4. Добавьте проперти daysToExpire в протокол Storable. Отсортируйте массив продуктов в холодильнике. Сначала пусть идут те, кто быстрее портятся. Если срок совпадает, то сортируйте по имени.

func sortedProductsToRefrigerator(products : [Food]) -> [Storable]{
    var productsInRefrigerator = [Storable]()
    for value in products{
        if let prod = value as? Storable{
            prod.expired ? print("\(prod.name) is bad") : print("\(prod.name) is fresh, time to expire is \(prod.daysToExpire)")
            if !prod.expired{
                productsInRefrigerator.append(prod)
            }
        } else {
             print("\(value.name);\(value.taste())")
        }
    }
    return productsInRefrigerator.sorted(by: { (a, b) -> Bool in
        a.daysToExpire < b.daysToExpire
    })
}

sortedProductsToRefrigerator(products: arrayOfProducts)








