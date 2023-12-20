//
//  TaskView.swift
//  TaskTool
//
//  Created by aijus on 2023/06/27.
//

import SwiftUI

struct TaskView: View {
    @StateObject var realmViewModel = Task()
    @Binding var colorList: [String]
    @Binding var selectOrder: String
    @Binding var status: String
    var body: some View {
        VStack{
            ScrollView(showsIndicators: false) {
                ForEach(realmViewModel.getSortedClothes(narrowDown: status, sort: selectOrder)) { item in
                    ZStack{
                        VStack(alignment: .leading) {
                            ZStack {
                                HStack {
                                    ForEach(0..<item.taskPriority + 1) { num in
                                        Image(systemName: "star.fill")
                                    }
                                }
                            }
                            .frame(width: 90, height: 25)
                            .background(.white.opacity(0.4))
                            .cornerRadius(8)
                            Spacer()
                            Text(item.taskTitle)
                                .font(.title2)
                                .fontWeight(.bold)
                            Spacer()
                            Group {
                                HStack {
                                    Image(systemName: "calendar")
                                    Text("\(formatDate(item.taskDate, returnFlag: true))")
                                }
                                HStack {
                                    Image(systemName: "clock")
                                    Text("\(formatDate(item.taskDate, returnFlag: false))")
                                }
                            }
                            .foregroundColor(.black.opacity(0.7))
                            .font(
                                Font.custom("Inter", size: 20)
                                    .weight(.medium)
                            )
                        }
                        .frame(width: UIScreen.main.bounds.width / 1.25,
                               height: UIScreen.main.bounds.height / 6,
                               alignment : .leading)
                        
                        VStack(alignment: .trailing) {
                            Button {
                                realmViewModel.delete(itemID: item.id)
                            } label: {
                                Image(systemName: "square.and.pencil")
                            }
                            .font(.title3)
                            Spacer()
                            Button {
                                
                            } label: {
                                Image(systemName: "checkmark.circle")
                            }
                            .font(.title3)
                        }
                        .frame(width: UIScreen.main.bounds.width / 1.25,
                               height: UIScreen.main.bounds.height / 6,
                               alignment : .trailing)
                    }
                    .foregroundColor(Color("MainColor"))
                    .frame(width: UIScreen.main.bounds.width / 1.1,
                           height: UIScreen.main.bounds.height / 5)
                    .background(Color(colorList[item.taskColor]))
                    .cornerRadius(8)
                }
                .padding(.top)
            }
        }
    }
    private func formatDate(_ date: Date, returnFlag: Bool) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let dateString = dateFormatter.string(from: date)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let timeString = timeFormatter.string(from: date)
        
        if returnFlag { return  "\(dateString)" }
        else { return"\(timeString)" }
    }
}
