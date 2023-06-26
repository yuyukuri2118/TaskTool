//
//  HomeModel.swift
//  TaskTool
//
//  Created by aijus on 2023/06/26.
//

import Foundation

final class HomeModel {
    @Published var isAll: Bool = true
    @Published var isUnfinish: Bool = false
    @Published var isFinish: Bool = false
    @Published var status: [Bool] = [true, false, false]


    func changeSelectSegment(_ len: Int) {
        status = [isAll, isUnfinish, isFinish]
        for i in 0 ..< status.count {
            status[i] = false
        }
        status[len] = true
    }
}
