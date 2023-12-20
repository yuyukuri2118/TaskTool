//
//  AddTaskView.swift
//  TaskTool
//

//  Created by aijus on 2023/07/13.
//

import SwiftUI

//MARK: - AddTaskView
struct AddTaskView: View {
    @StateObject var viewModel = AddTaskViewModel(model: AddTaskModel())
    @State var title = ""
    @State var date = Date()
    @State var time = ""
    @State var color = 0
    @State var priority = 0
    @Binding var colorList: [String]
    var body: some View {
        VStack{
            VStack{
                Text("タイトル")
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                AddTitleView(title: $title)
                    .padding(.bottom, 10)
                InsetDivider()
            }
            VStack{
                Text("カラー")
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                AddColorView(viewModel: viewModel, colorList: $colorList, color: $color)
                    .padding(.bottom, 10)
                InsetDivider()
            }
            VStack{
                Text("日時")
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                AddDateView(AddDate: $date, AddTime: $time)
                    .padding(.bottom, 10)
                InsetDivider()
            }
            VStack{
                Text("重要度")
                    .foregroundColor(.gray)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                AddPriority(priority: $priority)
                    .padding(.bottom, 10)
                InsetDivider()
            }
            VStack{
                RegisterButton(title: $title, date: $date, color: $color, priority: $priority)
                    .environmentObject(Task())
                BackButton()
                    .padding(.top, 15)
            }
        }
        .padding(.top, 80)
        .frame(width: UIScreen.main.bounds.width / 1.26)
        .navigationBarBackButtonHidden(true)
    }
}

//MARK: -  InsetDivider
struct InsetDivider: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: UIScreen.main.bounds.width / 1.26, height: 1)
            .background(Color(.gray))
    }
}

//MARK: - RegisterButton
struct RegisterButton: View {
    @Binding var title: String
    @Binding var date: Date
    @Binding var color: Int
    @Binding var priority: Int
    @EnvironmentObject var realmViewModel: Task
    @State private var showingErrorAlert = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            if (title.isEmpty) {
                showingErrorAlert = true
            } else {
                print("\(date)")
                realmViewModel.create(taskTitle: title,
                                      taskDate: date,
                                      taskColor: color,
                                      taskPriority: priority)
                dismiss()
            }
        } label: {
            ZStack{
                Text("保存")
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width / 1.26,
                   height: UIScreen.main.bounds.height / 14)
            .background(Color("MainColor"))
            .cornerRadius(90)
            .font(.title)
        }
        .padding(.top, 70)
        .alert(isPresented: $showingErrorAlert) {
            Alert(title: Text("未入力の項目があります"),
                  dismissButton: .default(Text("OK"))
            )
        }
    }
}

//MARK: - BackButton
struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAlert = false
    var body: some View {
        Button {
            showAlert = true
        } label: {
            ZStack{
                Text("戻る")
                    .foregroundColor(Color("MainColor"))
            }
            .frame(width: UIScreen.main.bounds.width / 1.26,
                   height: UIScreen.main.bounds.height / 14)
            .overlay(
                RoundedRectangle(cornerRadius: 90)
                    .stroke((Color("MainColor")), lineWidth: 3)
            )
            .cornerRadius(90)
            .font(.title)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("これまでの入力は破棄されます。"),
                  primaryButton: .cancel(Text("戻る")),
                  secondaryButton: .default(Text("OK"), action: { dismiss() })
            )
        }
    }
}
