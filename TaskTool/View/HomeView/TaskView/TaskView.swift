//
//  TaskView.swift
//  TaskTool
//
//  Created by aijus on 2023/06/27.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false) {
                ForEach(0..<4) { num in
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: UIScreen.main.bounds.width / 1.1,
                               height: UIScreen.main.bounds.height / 5)
                        .background(Color("red"))
                        .cornerRadius(8)
                }
                .padding(.top)
            }
        }
    }
}

