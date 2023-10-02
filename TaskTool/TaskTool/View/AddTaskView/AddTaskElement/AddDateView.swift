//
//  AddDateView.swift
//  TaskTool
//
//  Created by aijus on 2023/10/02.
//

import SwiftUI

struct AddDateView: View {
    @State  var selectedDate:Date = Date()
    @State private var sheet = false
    var body: some View {
        VStack {
            HStack{
                DatePicker("", selection: $selectedDate)
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                    .offset(x: -UIScreen.main.bounds.width / 6)
            }.frame(width: UIScreen.main.bounds.width / 1.26)
        }
    }
}
