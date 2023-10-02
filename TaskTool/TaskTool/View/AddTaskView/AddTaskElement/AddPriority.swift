//
//  AddPriority.swift
//  TaskTool
//
//  Created by aijus on 2023/10/02.
//
import SwiftUI

struct AddPriority: View {
    @State var priority = 1
    var body: some View {
        HStack{
            ForEach(0..<3, id: \.self) { num in
                Button {
                    priority = num
                } label: {
                    priority < num ?
                    Image(systemName: "star")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                    :
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                        .font(.largeTitle)
                }
            }
        }
    }
}
