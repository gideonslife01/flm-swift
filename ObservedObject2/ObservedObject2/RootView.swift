//
//  RootView.swift
//  ObservedObject2
//
//  Created by 김대경 on 12/4/25.
//
import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink("Go to ContentView again") {
                    ContentView()   // ← ⬅️ 여기서 재생성됨!
                }

                ContentView()
                    .padding()
            }
            .navigationTitle("RootView")
        }
    }
}

#Preview {
    RootView()
}
