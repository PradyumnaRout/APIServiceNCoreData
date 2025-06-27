//
//  ContentView.swift
//  APIServiceNCoreData
//
//  Created by hb on 23/06/25.
//

import SwiftUI

struct ContentView: View {
    
//    var obj = Operation()
//    var obj = SerialAndConcurrentQueueExecution()
    
    var obj = CombineOperators()
//    var obj = VerifyNumber()
//    var obj = SortingAlgos()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
