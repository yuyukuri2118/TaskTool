//
//  HomeViewModel.swift
//  TaskTool
//
//  Created by aijus on 2023/06/26.
//

import Foundation
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    @Published var status: [Bool]
    private var model: HomeModel
    private var cancellables = Set<AnyCancellable>()

    init(model: HomeModel) {
        self.model = model
        self.status = model.status
        
        self.model.$status
            .sink(receiveValue: { status in
                self.status = status
            })
            .store(in: &cancellables)
    }
    
    func changeStarsLength(_ len: Int) {
        model.changeSelectSegment(len)
    }
}
