//
//  ParentView.swift
//  PublisherSubscribe
//
//  Created by 김대경 on 11/24/25.
//

import SwiftUI

struct ParentView: View {
    
    // @StateObject → ViewModel을 "이 View에서 생성하고 보유"함
    // ViewModel을 직접 사용할 경우 @StateObject사용 함
    
    // @StateObject → "Create and hold the ViewModel in this View"
    // Use @StateObject when using the ViewModel directly.
    
    @StateObject var viewModel = CounterViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Parent View Count: \(viewModel.count)")
                .font(.title)
            
            Button("Increase") {
                viewModel.increase()
            }
            
            // 자식에게 ViewModel 전달
            ChildView(viewModel: viewModel)
        }
        .padding()
    }
}
