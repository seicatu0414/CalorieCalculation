//
//  Enums.swift
//  Calorie calculation
//
//  Created by yamaguchi kohei on 2025/02/05.
//

enum Nutrient:String {
    case protein
    case fat
    case carbohydrate
    var calorieFactor: Float {
        switch self {
        case .protein, .carbohydrate:
            return 4.0
        case .fat:
            return 9.0
        }
    }
}


