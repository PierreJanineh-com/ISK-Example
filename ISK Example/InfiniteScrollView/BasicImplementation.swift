//
//  BasicImplementation.swift
//  ISK Example
//
//  Created by Pierre Janineh on 21/09/2024.
//

import SwiftUI
import InfinityScrollKit

struct BasicImplementation: View {
    let arr: [String]
    
    var body: some View {
        InfiniteScrollView/*<String, Text>*/ (
            arr: arr,
            options: .init(countPerPage: 5)
        ) { item in
            Text(item)
        }
        // You can also use ScrollView modifiers directly
//        .scrollIndicators(.hidden)
    }
}

#Preview {
    BasicImplementation(arr: [])
}
