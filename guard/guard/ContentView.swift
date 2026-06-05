//
//  ContentView.swift
//  guard
//
//  Created by 김대경 on 11/29/25.
//

import SwiftUI

struct ContentView: View {
    @State var text:String = ""
    
    func process(_ value: Int?) {
        
        // 해당 조건과 다르면 모두 통과 됩니다.
        // If it is different from the condition, everything passes.
        guard let value = value else { return }
        guard value > 0 else { return }
        guard value != 999 else {  return }

        // 위의 guard를 모두 통과시 다음 부분을 처리 합니다.
        // If all of the guards above are passed, the next part is processed.
        print("Print Value:", value)
        text = "\(value)"
    }
    
    init(){
        
        // 제일 처음실행되며 여기서 함수실행시 ui에 표시되지 않음
        // It is executed first and is not displayed in the UI when the function is executed here.
        
        // process(Int(2));
    }


    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Text1:\(text)")

        }
        .padding()
        .onAppear(){
            
            // ui에 값을 정상적으로 표시하려면 여기에 표시할 것
            // If you want to display the value normally in the ui, display it here
            
            process(Int(2))
        }
    }
}

#Preview {
    ContentView()
}
