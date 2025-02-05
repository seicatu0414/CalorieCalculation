//
//  CaloriesStruct.swift
//  Calorie calculation
//
//  Created by yamaguchi kohei on 2025/02/05.
//

// structで余計な情報が入らないようにする
struct MajorNutrientsCaloriesStruct {
    var protein:Int
    var fat:Int
    var carbohydrate:Int
    
    init(protein: Int, fat: Int, carbohydrate: Int) {
        self.protein = protein
        self.fat = fat
        self.carbohydrate = carbohydrate
    }
}
