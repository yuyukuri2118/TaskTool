//
//  AddPriority.swift
//  TaskTool
//  MJKJNJNJN
//  Created by aijus on 2023/10/02.
//
import SwiftUI

struct AddPriority: View {
    @Binding var priority: Int
    var body: some View {
        HStack{
            ForEach(0..<3, id: \.self) { num in
                Button {
                    priority = num
                } label: {
                    priority < num ?
                    Image(systemName: "star")
                        .foregroundColor(Color("MainColor"))
                        .font(.largeTitle)
                    :
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("MainColor"))
                        .font(.largeTitle)
                }
            }
        }
    }
}
