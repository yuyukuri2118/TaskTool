//
//  AddColorView.swift
//  TaskTool
//
//  Created by aijus on 2023/10/02.
//

import SwiftUI

struct AddColorView: View {
    @ObservedObject var viewModel: AddTaskViewModel
    @State private var colorList = ["blue", "green", "orange", "purple", "red", "yellow"]
    var body: some View {
        HStack{
            ForEach(0..<colorList.count, id: \.self) { num in
                Button {
                    viewModel.selectColor(num)
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(Color(colorList[num]))
                            .frame(width: 30, height: 30)
                        
                        viewModel.colorList[num] ?
                        Circle()
                            .stroke(Color("MainColor"), lineWidth: 1)
                            .foregroundColor(.clear)
                            .frame(width: 33, height: 33)
                        :
                        Circle()
                            .stroke(Color.clear, lineWidth: 0)
                            .foregroundColor(.clear)
                            .frame(width: 33, height: 33)
                    }
                }
            }
        }
    }
}
