import UIKit

enum Gender: Comparable  {
    case male
    case female
    
    static func < (lhs: Gender, rhs: Gender) -> Bool {
        if lhs == .female && rhs == .male {
            return true
        } else {
            return false
        }
    }
}

final class People {
    let name: String
    let age: Int
    let gender: Gender
    
    init(name: String, age: Int, gender: Gender) {
        self.name = name
        self.age = age
        self.gender = gender
    }

    
}
