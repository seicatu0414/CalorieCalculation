//
//  MajorNutrientsIntakesStruct.swift
//  Calorie calculation
//
//  Created by yamaguchi kohei on 2025/02/05.
//

// structで余計な情報が入らないようにする
struct MajorNutrientsIntakesStruct {
    let protein: Float
    let fat: Float
    let carbohydrate: Float
    
    init (protein: Float, fat: Float, carbohydrate: Float) {
        self.protein = protein
        self.fat = fat
        self.carbohydrate = carbohydrate
    }
}

