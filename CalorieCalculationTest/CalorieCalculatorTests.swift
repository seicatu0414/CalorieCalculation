//
//  ExampleTests.swift
//  Calorie calculation
//
//  Created by yamaguchi kohei on 2025/02/06.
//

import XCTest
@testable import Calorie_calculation

final class CalorieCalculatorTests: XCTestCase {
    
    // `roundToFirstDecimal` のテスト
    func testRoundToFirstDecimal() {
        XCTAssertEqual(CalorieCalculator.roundToFirstDecimal(56.784), 56.8, "四捨五入が正しく処理されていません")
        XCTAssertEqual(CalorieCalculator.roundToFirstDecimal(70.925), 70.9, "四捨五入が正しく処理されていません")
        XCTAssertEqual(CalorieCalculator.roundToFirstDecimal(300.657), 300.7, "四捨五入が正しく処理されていません")
        XCTAssertEqual(CalorieCalculator.roundToFirstDecimal(-4.444), -4.4, "負の値の処理が正しくありません")
        XCTAssertEqual(CalorieCalculator.roundToFirstDecimal(9.999), 10.0, "四捨五入の処理が間違っています")
        XCTAssertEqual(CalorieCalculator.roundToFirstDecimal(0.0), 0.0, "ゼロの処理が間違っています")
    }
    
    // `getCalorieFactor` のテスト
    func testGetCalorieFactor() {
        XCTAssertEqual(CalorieCalculator.getCalorieFactor(for: "protein"), 4.0, "Proteinのカロリー係数が正しく取得できません")
        XCTAssertEqual(CalorieCalculator.getCalorieFactor(for: "fat"), 9.0, "Fatのカロリー係数が正しく取得できません")
        XCTAssertEqual(CalorieCalculator.getCalorieFactor(for: "carbohydrate"), 4.0, "Carbohydrateのカロリー係数が正しく取得できません")
        
        // 存在しない栄養素
        XCTAssertNil(CalorieCalculator.getCalorieFactor(for: "fiber"), "存在しない栄養素に対してnilを返すべき")
        XCTAssertNil(CalorieCalculator.getCalorieFactor(for: "water"), "存在しない栄養素に対してnilを返すべき")
    }
    
    // `calculateCalories` のテスト
    func testCalculateCalories() {
        let intakeStruct = MajorNutrientsIntakesStruct(protein: 56.784, fat: 70.925, carbohydrate: 300.657)
        
        let expectedCalories = MajorNutrientsCaloriesStruct(protein: 227, fat: 638, carbohydrate: 1203)
        let calculatedCalories = CalorieCalculator.calculateCalories(from: intakeStruct)
        XCTAssertNotNil(calculatedCalories, "カロリー計算が失敗しました")
        XCTAssertEqual(calculatedCalories?.protein, expectedCalories.protein, "Proteinのカロリー計算が間違っています")
        XCTAssertEqual(calculatedCalories?.fat, expectedCalories.fat, "Fatのカロリー計算が間違っています")
        XCTAssertEqual(calculatedCalories?.carbohydrate, expectedCalories.carbohydrate, "Carbohydrateのカロリー計算が間違っています")
    }
    
    // `calculateCalories` で存在しないプロパティがあった場合
    func testCalculateCaloriesWithUnknownProperty() {
        let invalidIntakeStruct = MajorNutrientsIntakesStruct(protein: 56.784, fat: 70.925, carbohydrate: 300.657)
        let calculatedCalories = CalorieCalculator.calculateCalories(from: invalidIntakeStruct)
        XCTAssertNotNil(calculatedCalories, "カロリー計算が失敗しました")
        XCTAssertEqual(calculatedCalories?.protein, 227, "Proteinのカロリー計算が間違っています")
        XCTAssertEqual(calculatedCalories?.fat, 638, "Fatのカロリー計算が間違っています")
        XCTAssertEqual(calculatedCalories?.carbohydrate, 1203, "Carbohydrateのカロリー計算が間違っています")
    }
}

