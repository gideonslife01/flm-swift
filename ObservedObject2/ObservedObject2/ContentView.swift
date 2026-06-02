//
//  ContentView.swift
//  ObservedObject2
//
//  Created by 김대경 on 12/4/25.
//

import SwiftUI
import Combine // add Combine


class MyViewModel: ObservableObject {
    @Published var data = ""
    
    init() {
        print("MyViewModel init")
        fetchData() // 네트워크 호출 같은 작업
    }
    func fetchData() {
        print("fetchData called")
        data = "Data Updated..."
    }
}

struct ContentView: View {
@State private var count = 0
    //@ObservedObject var vm = MyViewModel() // 오류 구조
   @StateObject var vm = MyViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Data:\(vm.data)")
            
            Button("Update view") {
                count += 1
                print(count)
                vm.fetchData()
            }
            Button("Update Clear") {
                count = 0
                vm.data = "Clear"
                print(count)
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
