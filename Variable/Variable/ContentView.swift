//
//  ContentView.swift
//  Variable
//
//  Created by 김대경 on 11/25/25.
//  변수와 상수 / Variables and Constants

import SwiftUI


struct ContentView: View {
    
    // let :
    // 상수 / constant --> 초기화 후 값을 변경 할 수 없음.
    // constant --> The value cannot be changed after initialization.
    
    // var :
    // 변수 / variable --> 초기화 후에도 값을 바꿀 수 있음.
    // variable --> The value can be changed even after initialization.
    
    // 모든 사항이 초기화 되었다고 컴파일러가 판단 할 수 없습니다.
    // 그래서 Swift는 이런 형태의 초기화를 막고 있습니다.
    
    // The compiler cannot determine that everything has been initialized.
    // That's why Swift prevents this type of initialization.
    
    // var countVar = 10
    // var countVar2 = 20
    // var changeVarCount: Int = count + 1 --> error
    
    // let countLet = 10
    // let countLet2 = 20
    // let countLetCount: Int = countLet + 1 --> error
    
    /*
     let countLet = 10
     let countLetCount = countLet + 1
     
     바로 위의 형태는 내부적으로 다음과 같이 해석됩니다.
     The form just above is internally interpreted as follows:
     
     self.countLet = 10
     self.countLetCount = self.countLet + 1

     그래서 self(struct ContentView)가 아직 완전히 초기화 되었는지
     보장 할 수 없기 때문에 오류가 발생합니다.
     
     So, the error occurs because Swift can't guarantee that self(struct ContentView) is fully initialized.
    */

    
    var countVar = 10
    var countVar2: Int
    
    let countLet: Int
    let countLet2:Int

    
    // init()을 사용하여 self가 생성된 이후 초기화 하기
    // Initialize self after it is created using init()
    
    init() {
        countLet = countVar + 1
        print("countLet: \(countLet)")
        
        countVar2 = 10
        countVar2 =  10 + 1
        
        countLet2 = 20
        
        // let은 상수이기 때문에 아래의 코드 실행시 다음과 오류가 발생합니다.
        // Since let is a constant, the following error occurs when executing the code below.
        // countLet2 = 20 + 1
        
        // error: Immutable value 'self.countLet2' may only be initialized once


    }
    
    // ====       body안에 변수 선언 할 수 없음.       ==== //
    // ==== Cannot declare variables inside body ==== //
    
    var body: some View {
        
        VStack {

            
            // ====        뷰 안에서 변수 출력 방법         ==== //
            // ==== How to output variables in a view ==== //
            // Text(countVar) --> error
            
            Text("\(countVar)")
            Text("Count Variable:\(countVar)")
            Text("Count:\(String(countVar))")
            
        }
        .padding()
        .onAppear{
            
            // countLet이 두번씩 출력되는 이유는
            // 값 타입 구조체(View)라서 body가 재계산될 때마다 새로운 인스턴스가 만들어집니다.
            
            // The reason countLet is printed twice is because it is a value type structure (View),
            // so a new instance is created each time body is recalculated.
            
            
            //onAppear는 화면에 나타날때 한번만 실행하는 코드부분입니다.
            //onAppear is a code section that runs only once when it appears on the screen.
            
            print("countVar2:\(countVar2)")
        }
    }
}

#Preview {
    ContentView()
}
