//
//  CounterViewModel.swift
//  PublisherSubscribe
//
//  Created by 김대경 on 11/22/25.
//

import Foundation
import Combine

// ObservableObject는 ViewModel이 UI에게 “내가 변했으니 다시 그려달라”라고 알릴 수 있게 하는 SwiftUI 전용 프로토콜입니다.
// SwiftUI에서 ObservableObject는 **“외부에서 관찰 가능한 객체”**를 만들기 위한 프로토콜입니다.

// ObservableObject is a SwiftUI-specific protocol that allows the ViewModel to tell the UI, "I changed, so please redraw me."
// In SwiftUI, ObservableObject is a protocol for creating "objects that are observable from the outside".

class CounterViewModel: ObservableObject {
    
    // @Published: 값이 바뀌면 이벤트를 내보내는 Publisher
    // @Published: Publisher that emits an event when the value changes
    
    @Published var count: Int = 0
    
    func increase() {
        count += 1
    }
}

/*
 
 @Published = objectWillChange.send()를 자동으로 호출해주는 편의 기능입니다.
 원래는 직접 objectWillChange.send()를 호출하면, @Published 없이도 UI를 업데이트 가능합니다.
 단, 개발자가 값이 바뀔 때마다 send()를 직접 호출해야 합니다.
 이런 부분을 자동으로 처리해주는게 @Published입니다.
 
 @Published is a convenience feature that automatically calls objectWillChange.send().
 Originally, if you call objectWillChange.send() directly, you can update the UI without @Published .
 However, developers must manually call send() every time a value changes.
 @Published handles this automatically.
 
 */
