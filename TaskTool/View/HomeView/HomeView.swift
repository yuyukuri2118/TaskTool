//
//  HomeView.swift
//  TaskTool
//
//  Created by aijus on 2023/06/26.
//

import SwiftUI

struct HomeView: View {
    @State private var colorList = ["red", "blue", "green", "orange", "purple", "yellow"]
    var body: some View {
        NavigationStack {
            ZStack{
                VStack{
                    SegmentView()
                    TaskView(colorList: $colorList)
                        .onAppear()
                }
                NavigationLink {
                    AddTaskView(colorList: $colorList)
                } label: {
                    ZStack {
                        Circle()
                            .foregroundColor(Color("MainColor"))
                            .frame(width: 70, height: 70)
                        Rectangle()
                            .frame(width: 50, height: 6)
                            .cornerRadius(50)
                        Rectangle()
                            .frame(width: 6, height: 50)
                            .cornerRadius(50)
                    }
                    .foregroundColor(.white)
                }
                .position(x: UIScreen.main.bounds.width / 1.2,
                          y: UIScreen.main.bounds.height / 1.2)
            }
        }
    }
}
