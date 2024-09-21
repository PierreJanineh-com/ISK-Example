//
//  ContentView.swift
//  ISK Example
//
//  Created by Pierre Janineh on 16/09/2024.
//

import SwiftUI
import InfinityScrollKit

struct ContentView: View {
    
    private var arr: [String] = []
    
    init() {
        // Dummy array
        for i in 0...500 {
            self.arr.append("Cell #\(i)")
        }
    }
    
    var body: some View {
        BasicImplementation(arr: arr)
    }
}

#Preview {
    ContentView()
}

extension String: @retroactive Identifiable {
    public var id: String {
        self
    }
}
