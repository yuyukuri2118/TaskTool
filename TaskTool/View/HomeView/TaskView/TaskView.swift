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
                    TaskItemView()
                }
                .padding(.top)
            }
        }
    }
}

struct TaskItemView: View {
    var body: some View {
        ZStack{
            VStack(alignment: .leading) {
                ZStack {
                    HStack {
                        ForEach(0..<2) { num in
                            Image(systemName: "star.fill")
                        }
                    }
                }
                .frame(width: 90, height: 25)
                .background(.white.opacity(0.4))
                .cornerRadius(8)
                Spacer()
                Text("デスク周りの整理")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Group {
                    HStack {
                        Image(systemName: "calendar")
                        Text("06/30(金)")
                    }
                    HStack {
                        Image(systemName: "clock")
                        Text("21:00")
                    }
                }
                .font(
                    Font.custom("Inter", size: 12)
                        .weight(.medium)
                )
            }
            .frame(width: UIScreen.main.bounds.width / 1.25,
                   height: UIScreen.main.bounds.height / 6,
                   alignment : .leading)
            
            VStack(alignment: .trailing) {
                Button {
                    
                } label: {
                    Image(systemName: "square.and.pencil")
                }
                .font(.title3)
                Spacer()
                Button {
                } label: {
                    Image(systemName: "checkmark.circle")
                }
                .font(.title3)
            }
            .frame(width: UIScreen.main.bounds.width / 1.25,
                   height: UIScreen.main.bounds.height / 6,
                   alignment : .trailing)
        }
        .foregroundColor(Color("MainColor"))
        .frame(width: UIScreen.main.bounds.width / 1.1,
               height: UIScreen.main.bounds.height / 5)
        .background(Color("red"))
        .cornerRadius(8)
    }
}
