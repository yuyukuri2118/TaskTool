//
//  SegmentView.swift
//  TaskTool
//
//  Created by aijus on 2023/06/26.
//

import SwiftUI

struct SegmentView: View {
    var body: some View {
        VStack{
            TitleView()
            StatusView(viewModel: HomeViewModel(model: HomeModel()))
            SegmentSetView()
        }
    }
}




