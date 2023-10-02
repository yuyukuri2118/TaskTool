//
//  AddTaskViewModel.swift
//  TaskTool
//
//  Created by aijus on 2023/07/13.
//

import Foundation
import Combine

@MainActor
class AddTaskViewModel: ObservableObject {
    @Published var colorList: [Bool]
    private var model: AddTaskModel
    private var cancellables = Set<AnyCancellable>()

    init(model: AddTaskModel) {
        self.model = model
        self.colorList = model.colorList
        
        self.model.$colorList
            .sink(receiveValue: { color in
                self.colorList = color
            })
            .store(in: &cancellables)
    }
    
    func selectColor(_ len: Int) {
        model.selectColor(len)
    }
}
