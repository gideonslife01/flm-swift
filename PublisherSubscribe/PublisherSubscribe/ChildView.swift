//
//  ChildView.swift
//  PublisherSubscribe
//
//  Created by 김대경 on 11/24/25.
//
import SwiftUI

// ParentView에 포함되는 뷰
struct ChildView: View {
    // @ObservedObject → 부모에서 전달받은 ViewModel을 "관찰"만 함
    // 자식 뷰가 부모 뷰에게서 ViewModel을 전달 받은경우 @ObservedObject를 사용함.
    @ObservedObject var viewModel: CounterViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Child View Count: \(viewModel.count)")
                .font(.headline)
            
            Button("Increase from Child") {
                viewModel.increase()
            }
        }
        .padding()
        .border(Color.gray)
    }
}
