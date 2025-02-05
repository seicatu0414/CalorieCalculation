//
//  MyAppTests.swift
//  Calorie calculation
//
//  Created by yamaguchi kohei on 2025/02/06.
//

import XCTest
@testable import Calorie_calculation

final class MyAppTests: XCTestCase {
    
    // NutrientsProtcolに余分なプロパティがある場合でもMajorNutrientsIntakesStructに影響しないことをテスト
    func testRunWithExtraProperties() {
        struct ExtendedNutrientsStruct: NutrientsProtcol {
            var protein: Float = 50.0
            var fat: Float = 20.0
            var carbohydrate: Float = 100.0
            var fiber: Float = 8.0
        }
        let nutrients = ExtendedNutrientsStruct()
        // `run` メソッドを実行し、`print` の代わりにキャプチャ
        let mirror = Mirror(reflecting: MajorNutrientsIntakesStruct(protein: nutrients.protein,
                                                                    fat: nutrients.fat,
                                                                    carbohydrate: nutrients.carbohydrate))
        // fiberが含まれていないかの確認
        for child in mirror.children {
            XCTAssertNotEqual(child.label, "fiber", "余分なプロパティ `fiber` が含まれています")
        }
        // CalorieCalculator.calculateCalories(from:)に渡される値が正しいことを確認
        let calorieResults = CalorieCalculator.calculateCalories(from: MajorNutrientsIntakesStruct(protein: nutrients.protein,
                                                                                                   fat: nutrients.fat,
                                                                                                   carbohydrate: nutrients.carbohydrate))
        XCTAssertNotNil(calorieResults, "カロリー計算が失敗しました")
        XCTAssertEqual(calorieResults?.protein, 200, "Protein のカロリー計算が間違っています")
        XCTAssertEqual(calorieResults?.fat, 180, "Fat のカロリー計算が間違っています")
        XCTAssertEqual(calorieResults?.carbohydrate, 400, "Carbohydrate のカロリー計算が間違っています")
    }
}

