//
//  AddTaskModel.swift
//  TaskTool
//
//  Created by aijus on 2023/07/13.
//

import Foundation

final class AddTaskModel {
    @Published var colorList = [true, false, false, false, false, false]

    func selectColor(_ len: Int) {
        for i in 0 ..< colorList.count {
            colorList[i] = false
        }
        colorList[len] = true
    }
}



