//
//  AddTitleView.swift
//  TaskTool
//
//  Created by aijus on 2023/10/02.
//
import SwiftUI

struct AddTitleView: View {
    @State private var taskName = ""
    var body: some View {
        TextField("タスクを入力", text: $taskName)
            .font(.system(size: 18, weight: .medium))
            .padding()
            .background(Color.gray.opacity(0.12))
            .cornerRadius(10)
            .accentColor(.black)
            .foregroundColor(Color.black.opacity(0.7))
            .multilineTextAlignment(TextAlignment.center)
    }
}
