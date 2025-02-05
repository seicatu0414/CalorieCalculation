//
//  MyApp.swift
//  Calorie calculation
//
//  Created by yamaguchi kohei on 2025/02/05.
//

// プロトコルに準拠した型のみ受け取る
class MyApp {
    // NutrientsProtcolを継承したすべてのStructを受け入れる
    func run<T: NutrientsProtcol>(nutrientsStruct: T) {
        // protcolの中から三大要素を取り出して共通化
        let majorNutrientsIntakesStruct = MajorNutrientsIntakesStruct.init(protein: nutrientsStruct.protein,
                                                                           fat: nutrientsStruct.fat,
                                                                           carbohydrate: nutrientsStruct.carbohydrate)
        guard let calorieResults = CalorieCalculator.calculateCalories(from: majorNutrientsIntakesStruct) else { return }
        let mirror = Mirror(reflecting: calorieResults)
        for child in mirror.children {
            print("\(child.label ?? ""): \(child.value)")
        }
    }
}
