//
//  SegmentSetView.swift
//  TaskTool
//
//  Created by aijus on 2023/06/27.
//

import SwiftUI

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
