//
//  StatusView.swift
//  TaskTool
//
//  Created by aijus on 2023/06/27.
//

import SwiftUI

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
                        .frame(width: 100, height: 40)
                        .background(Color(red: 0.24, green: 0.24, blue: 0.24))
                        .cornerRadius(100)
                    :
                    Text(statusList[num])
                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.24))
                        .frame(width: 100, height: 40)
                        .background(Color.white)
                        .cornerRadius(100)
                }
                .animation(.easeInOut, value: viewModel.status)
            }
        }
    }
}
