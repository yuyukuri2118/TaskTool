//
//  SegmentView.swift
//  TaskTool
//
//  Created by aijus on 2023/06/26.
//

import SwiftUI

struct SegmentView: View {
    var body: some View {
        VStack{
            TitleView()
            StatusView(viewModel: HomeViewModel(model: HomeModel()))
            SegmentSetView()
        }
    }
}

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

struct StatusView: View {
    @StateObject var viewModel: HomeViewModel
    @State var statusList: [String] = ["全て","未完了","完了"]
    var body: some View {
        HStack{
            ForEach(0..<statusList.count, id: \.self) { num in
                Button {
                    viewModel.changeStarsLength(num)
                } label: {
                    viewModel.status[num] ?
                    Text(statusList[num])
                        .foregroundColor(.white)
                        .frame(width: 100, height: 33)
                        .background(Color(red: 0.24, green: 0.24, blue: 0.24))
                        .cornerRadius(100)
                    :
                    Text(statusList[num])
                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.24))
                        .frame(width: 100, height: 33)
                        .background(Color.white)
                        .cornerRadius(100)
                }
                .animation(.easeInOut, value: viewModel.status)
            }
        }
    }
}


struct SegmentSetView: View {
    @State var SegmentOrder: [String] = ["日付順", "重要度順"]
    @State var SelectOrder: String = "日付順"
    init() {
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor : UIColor.white], for: .normal
        )
        
        UISegmentedControl.appearance().setTitleTextAttributes(
            [.foregroundColor : UIColor.black], for: .selected
        )
    }
    var body: some View {
        Picker(selection: $SelectOrder, label: Text("")) {
            ForEach(0..<self.SegmentOrder.count, id: \.self) { id in
                Text(SegmentOrder[id]).tag(0).tag(self.SegmentOrder[id])
            }
        }
        .background(Color("MainColor"))
        .pickerStyle(SegmentedPickerStyle())
        .cornerRadius(10)
        .clipped()
        .pickerStyle(.segmented)
        .frame(width: UIScreen.main.bounds.width / 1.2)
    }
}

