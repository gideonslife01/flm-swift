//
//  ContentView.swift
//  ObservedObject
//
//  Created by 김대경 on 12/4/25.
//

import SwiftUI
import Combine


class UserSettings: ObservableObject {
  @Published var username = "Anonymous"
}

struct ContentView: View {
    
    // @StateObject는 SwiftUI의 state storage(뷰의 라이프 싸이클 동안 보관되는 저장소)에
    // 인스턴스를 저장하고, 처음 뷰가 생성될 때만 초기화하도록 보장합니다.
    // @StateObject stores an instance in SwiftUI's state storage (which is kept throughout the view's lifecycle) and ensures that it is initialized only when the view is first created.
    
    @StateObject var settings = UserSettings()
    
    // @ObservedObject는 구조체의 초기화 시점에 계속해서UserSettings()를 다시 실행 합니다.
    // @ObservedObject will continually re-run UserSettings() at the time of initialization of the struct.
    
    //@ObservedObject var settings = UserSettings()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
            
                .foregroundStyle(.tint)
            Text("User name:\(settings.username)")
                .padding()
            
            Button("John Doe"){
                settings.username = "Jhon Doe"
            }
            Button("Anonymous"){
                settings.username = "Anonymous"
            }
            
            Text("Child View")
        }
        .padding()
    }
}


#Preview {
    ContentView()
}
