//
//  AddTaskView.swift
//  TaskTool
//
//  Created by aijus on 2023/07/13.
//

import SwiftUI

struct AddTaskView: View {
    @StateObject var viewModel = AddTaskViewModel(model: AddTaskModel())
    var body: some View {
        VStack{
            VStack{
                Text("タイトル")
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                AddTitleView()
                    .padding(.bottom, 10)
                InsetDivider()
            }
            VStack{
                Text("カラー")
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                AddColorView(viewModel: viewModel)
                    .padding(.bottom, 10)
                InsetDivider()
            }
            VStack{
                Text("日時")
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                AddDateView()
                    .padding(.bottom, 10)
                InsetDivider()
            }
            VStack{
                Text("重要度")
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                AddPriority()
                    .padding(.bottom, 10)
                InsetDivider()
            }
        }.frame(width: UIScreen.main.bounds.width / 1.26)
    }
    struct AddTaskView_Previews: PreviewProvider {
        static var previews: some View {
            AddTaskView()
        }
    }
}

struct InsetDivider: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: UIScreen.main.bounds.width / 1.26, height: 1)
            .background(Color(.gray))
    }
}

