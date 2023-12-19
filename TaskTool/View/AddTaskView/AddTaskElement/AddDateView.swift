//
//  AddDateView.swift
//  TaskTool
//
//  Created by aijus on 2023/10/02.
//

import SwiftUI

struct AddDateView: View {
    @State var selectedDate:Date = Date()
    @State private var sheet = false
    @Binding var AddDate: String
    @Binding var AddTime: String
    var body: some View {
        VStack {
            HStack{
                DatePicker("", selection: $selectedDate)
                    .environment(\.locale, Locale(identifier: "ja_JP"))
                    .offset(x: -UIScreen.main.bounds.width / 6)
                    .onChange(of: selectedDate) {
                        formatDate(selectedDate)
                    }
            }.frame(width: UIScreen.main.bounds.width / 1.26)
        }
    }
    private func formatDate(_ date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let dateString = dateFormatter.string(from: date)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let timeString = timeFormatter.string(from: date)
        
        AddDate = "\(dateString) "
        AddTime = "\(timeString)"
    }
}
