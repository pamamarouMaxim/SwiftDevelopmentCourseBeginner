//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//1. Создайте тип Комната. У комнаты есть размеры W на H. И создайте тип Персонаж. У негоесть координата в комнате X и Y. Реализуйте функцию, которая красивенько текстом будет показывать положение персонажа в комнате
//
//2. Персонажу добавьте метод идти, который принимает энумчик лево, право, верх, вниз
//Этот метод должен передвигать персонажа. Реализуйте правило что персонаж не должен покинуть пределы комнаты. Подвигайте персонажа и покажите это графически
//
//3. Создать тип Ящик. У ящика также есть координата в комнате X и Y. Ящик также не может покидать пределы комнаты и ящик также должен быть распечатан вместе с персонажем в функции печати.
//
//4. Теперь самое интересное, персонаж может двигать ящик, если он стоит на том месте, куда персонаж хочет попасть. Главное что ни один объект не может покинуть пределы комнаты. Подвигайте ящик :)
//
//5. Добавьте точку в комнате, куда надо ящик передвинуть и двигайте :)

struct Location{
    var x : Int
    var y : Int
}

enum valueOfCell : String {
    
    case  ball        = "🎾"
    
    case  whiteCell   = "⬜"
    
    case  blackCell   = "⬛"
    
    case  goal         = "⭕"
    
    case  imageHuman  = "🏃"    }

struct RoomForGame {
    
    var size : (width : Int , height : Int)
    
}

struct Human {
    
    var location : Location
    
    let image = valueOfCell.imageHuman
    
    enum Move : String{
        case Right   = "Right"
        case Left    = "Left"
        case Top     = "Top"
        case Button  = "Button"
        case Stay    = "Stay"
    }
    
    mutating func moveHuman(side: Move, box : inout Ball){
        
        switch side{
        case .Right : location.x += 1;
        if box.location.x == location.x && box.location.y == location.y{
              box.location.x += 1
            }
        case .Left  : location.x -= 1;
        if box.location.x == location.x && box.location.y == location.y{
            box.location.x -= 1
            }
        case .Top   : location.y -= 1;
        if box.location.x == location.x && box.location.y == location.y{
            box.location.y -= 1
            }
        case .Button: location.y += 1;
        if box.location.x == location.x && box.location.y == location.y{
            box.location.y += 1
            }
        default: break
        }
    }

    
}

struct Goal {
    
    var location : Location
    
    let image    =  valueOfCell.goal
    
}

struct Ball {
    
    var location : Location
    
    let image    =  valueOfCell.ball
    
}

func printRoomWithObjects(room : RoomForGame, human : Human, ball : Ball, goal : Goal ,
                          function : ([String])->()){
    if ball.location.x == goal.location.x && ball.location.y == goal.location.y{
        print("Greate! You are winner")
    }
        var arrayOfRow = [String]()
        for pointY in 1...room.size.width{
            var cell = String()
            for pointX in 1...room.size.height{
                switch (pointX,pointY) {
                case (human.location.x,human.location.y): cell.append(String(human.image.rawValue))
                case (ball.location.x,ball.location.y)  : cell.append(String(ball.image.rawValue))
                case (goal.location.x,goal.location.y)  : cell.append(String(goal.image.rawValue))
                case (let row,let column) where row == 1    || row == room.size.height      ||
                    column == 1 || column == room.size.width     :
                    cell.append(valueOfCell.blackCell.rawValue)
                default : cell.append(valueOfCell.whiteCell.rawValue)
                }
            }
            arrayOfRow.append(cell)
        }
        function(arrayOfRow)
    
}


func revisionOfMove(room : RoomForGame, human : Human, ball : Ball, goal : Goal) -> Bool{
    
    var humanTest = human
    var array = [Human]()
    array.append(human)
    
    humanTest.location.x = ball.location.x
    humanTest.location.y = ball.location.y
    array.append(humanTest)
    
    humanTest.location.x = goal.location.x
    humanTest.location.y = goal.location.y
    array.append(humanTest)
    
    for i in array{
        let location = (i.location.x,i.location.y)
        switch location {
        case (let row,let column) where row == 1    || row == room.size.height      ||
            column == 1 || column == room.size.width     : return false
        default: break
        }
    }
    
    return true
}

func move(sideToMove: Human.Move, ball:inout Ball, room: RoomForGame, human: inout Human, goal: Goal){
    human.moveHuman(side: sideToMove , box: &ball)
    if !revisionOfMove(room: room, human: human, ball: ball, goal: goal){
        print("You can't go to the \(sideToMove.rawValue) !!!")
        switch sideToMove {
        case .Button:   human.moveHuman(side: .Top , box: &ball)
        case .Top   :   human.moveHuman(side: .Button , box: &ball)
        case .Left  :   human.moveHuman(side: .Right , box: &ball)
        case .Right :   human.moveHuman(side: .Left , box: &ball)
        default : break
           
        }
    } else {
        print("You made a move to the \(sideToMove.rawValue) !!!")
        printRoomWithObjects(room: sizeOfRoom, human: human, ball: ball, goal: goal) { (array) in
            for cell in array{
                print("\(cell)")
            }
        }

    }
}

let sizeOfRoom = RoomForGame(size: (width: 10, height: 10))

let goal = Goal(location: Location(x: 5, y: 5))

var ball = Ball(location: Location(x: 3, y: 3))

var human = Human(location: Location(x: 2, y: 2))


move(sideToMove: .Stay, ball: &ball, room: sizeOfRoom, human: &human, goal: goal)
move(sideToMove: .Left, ball: &ball, room: sizeOfRoom, human: &human, goal: goal)
move(sideToMove: .Top, ball: &ball, room: sizeOfRoom, human: &human, goal: goal)
move(sideToMove: .Right, ball: &ball, room: sizeOfRoom, human: &human, goal: goal)
move(sideToMove: .Button, ball: &ball, room: sizeOfRoom, human: &human, goal: goal)
move(sideToMove: .Button, ball: &ball, room: sizeOfRoom, human: &human, goal: goal)
move(sideToMove: .Left, ball: &ball, room: sizeOfRoom, human: &human, goal: goal)
move(sideToMove: .Button, ball: &ball, room: sizeOfRoom, human: &human, goal: goal)
move(sideToMove: .Right, ball: &ball, room: sizeOfRoom, human: &human, goal: goal)
move(sideToMove: .Right, ball: &ball, room: sizeOfRoom, human: &human, goal: goal)

