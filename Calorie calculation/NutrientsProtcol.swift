//
//  NutrientsProtcol.swift
//  Calorie calculation
//
//  Created by yamaguchi kohei on 2025/02/05.
//

// 栄養素プロトコル３大栄養素なので共通化
protocol NutrientsProtcol {
    var protein: Float { get }
    var fat: Float { get }
    var carbohydrate: Float { get }
}
