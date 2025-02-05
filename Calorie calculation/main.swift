//
//  main.swift
//  Calorie calculation
//
//  Created by yamaguchi kohei on 2025/02/05.
//

import Foundation

// アプリのエントリーポイント
let app = MyApp()
//計算したいStruct
//let natto:NutrientsProtcol = NattoStruct()
let rice:NutrientsProtcol = RiceStruct()
app.run(nutrientsStruct: rice)

