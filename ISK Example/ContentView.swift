//
//  ContentView.swift
//  ISK Example
//
//  Created by Pierre Janineh on 16/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    private var arr: [String] = []
    
    init() {
        // Dummy array
        for i in 0...500 {
            self.arr.append("Cell #\(i)")
        }
    }
    
    var body: some View {
        VStack {
            TitleText("Basic implementation")
            BasicImplementation(arr: arr)
            
            Divider()
            
            TitleText("Customized implementation")
            CustomizedImplementation()
			
			// Uncomment to test on iOS
//			TitleText("UIKit implementation")
//			UIKitImplementation()
			
			// Uncomment to test on macOS
//			TitleText("AppKit implementation")
//			AppKitImplementation()
        }
    }
	
	private func TitleText(_ string: String) -> Text {
		Text(string)
			.font(.title3)
			.fontWeight(.medium)
	}
}

#Preview {
    ContentView()
}
