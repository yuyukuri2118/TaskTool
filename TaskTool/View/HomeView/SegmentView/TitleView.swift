//
//  TitleView.swift
//  TaskTool
//
//  Created by aijus on 2023/06/27.
//

import SwiftUI

struct TitleView: View {
    @State var dateText = ""
    @State var nowDate = Date()
    private let dateFormatter = DateFormatter()
    init() {
        dateFormatter.dateFormat = "YYYY年MM月dd日"
        dateFormatter.locale = Locale(identifier: "ja_jp")
    }
    var body: some View {
        VStack{
            Text("タスク")
                .font(
                    Font.custom("Inter", size: 35)
                        .weight(.bold)
                )
                .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.24))
            Text(dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                        self.nowDate = Date()
                        dateText = "\(dateFormatter.string(from: nowDate))"
                    }
                }
                .font(
                    Font.custom("Inter", size: 16)
                        .weight(.light)
                )
                .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.24))
                .offset(x: UIScreen.main.bounds.width / 4)
        }
    }
}
