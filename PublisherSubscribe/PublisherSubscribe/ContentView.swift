//
//  ContentView.swift
//  PublisherSubscribe
//
//  Created by 김대경 on 11/22/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            ParentView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
