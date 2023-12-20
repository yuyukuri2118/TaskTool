//
//  SegmentView.swift
//  TaskTool
//
//  Created by aijus on 2023/06/26.
//

import SwiftUI

struct SegmentView: View {
    @Binding var status: String
    @Binding var SelectOrder: String
    var body: some View {
        VStack{
            TitleView()
            StatusView(viewModel: HomeViewModel(model: HomeModel()), 
                       status: $status)
            SegmentSetView(SelectOrder: $SelectOrder)
            Rectangle()
              .foregroundColor(.gray)
              .frame(width: UIScreen.main.bounds.width / 1.1, height: 1)
              .padding(.top)
        }
    }
}




