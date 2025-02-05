//
//  CalorieCalculator.swift
//  Calorie calculation
//
//  Created by yamaguchi kohei on 2025/02/05.
//

import Foundation

struct CalorieCalculator {
    
    // 小数第二位を四捨五入して小数第一位にする
    static func roundToFirstDecimal(_ value: Float) -> Float {
        return (value * 10).rounded() / 10
    }
    
    // カロリー計算（小数第一位で計算し、最終的に整数で四捨五入）
    static func calculateCalories(from intakeStruct: MajorNutrientsIntakesStruct) -> MajorNutrientsCaloriesStruct? {
        let mirror = Mirror(reflecting: intakeStruct)
        var calorieResults = MajorNutrientsCaloriesStruct(protein: 0, fat: 0, carbohydrate: 0)
        // どんなStructが来てもプロパティ分回る
        for (propertyName, value) in mirror.children {
            guard let propertyName = propertyName else {
                print("プロパティ名が取得できませんでした")
                return nil
            }
            
            guard let value = value as? Float else {
                print("\(propertyName) は Float型ではありません")
                return nil
            }
            
            let roundedIntake = roundToFirstDecimal(value)
            
            guard let constantCalories = getCalorieFactor(for: propertyName) else {
                print("\(propertyName) と一致する名前がEnum上にありません")
                return nil
            }
            // 少数第一位を四捨五入
            let calorieValue = Int((roundedIntake * constantCalories).rounded())
            // `calorieResults` の各プロパティに値を代入
            switch propertyName {
            case Nutrient.protein.rawValue:
                calorieResults.protein = calorieValue
            case Nutrient.fat.rawValue:
                calorieResults.fat = calorieValue
            case Nutrient.carbohydrate.rawValue:
                calorieResults.carbohydrate = calorieValue
            default:
                // 他の栄養素を追加したかったら引数とEnumを変更しここで取得
                // ※拡張するなら
                print("\(propertyName)は処理対象外です")
            }
        }
        
        return calorieResults
    }
    // enum要素とpropertyNameを一致させ固定カロリーを返す
    static func getCalorieFactor(for propertyName: String) -> Float? {
        guard let nutrient = Nutrient(rawValue: propertyName) else {
            print("\(propertyName)と一致する名前がEnum上にありません")
            return nil
        }
        return nutrient.calorieFactor
    }
}
