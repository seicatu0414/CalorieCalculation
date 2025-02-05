//
//  NattoStruct.swift
//  Calorie calculation
//
//  Created by yamaguchi kohei on 2025/02/05.
//

// 情報を柔軟に取れる&最低限の情報が必ず存在するようにprotcolを噛ませる
struct NattoStruct: NutrientsProtcol {
    let protein:Float = 16.5
    let fat:Float = 10.0
    let carbohydrate:Float = 12.1
}
