//
//  CustomizedImplementation.swift
//  ISK Example
//
//  Created by Pierre Janineh on 21/09/2024.
//

import SwiftUI
import InfinityScrollKit

struct CustomizedImplementation: View {
    @State private var arr: [String] = []
    @State private var isLoading: Bool = false
    
    var body: some View {
        InfiniteScrollView/*<String, Text, ProgressView, EmptyView>*/(
            arr: arr,
            options: options,
            onLoadingChanged: onLoadingChanged,
            cellView: CellView,
            lastCellView: LastCellView,
            emptyArrView: EmptyArrView
        )
    }
    
    private var options: Options<String> {
        .init(
            orientation: .horizontal,
            countPerPage: 2,
            paginationOptions: .init(
                concatMode: .auto, //.auto for automatically adding pages to the array instead of passing the full array everytime.
                onPageLoad: {
                    // Simulate an http request
                    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    
                    for i in arr.count...arr.count + 10 {
                        arr.append("Cell #\(i)")
                    }
                    return arr
                },
                onRefresh: {
                    // Simulate an http request
                    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    
                    for i in 0...25 {
                        arr.append("Cell #\(i)")
                    }
                    return arr
                }
            )
        )
    }
    
    private func onLoadingChanged(_ isLoading: Bool) {
        self.isLoading = isLoading
        
        if self.isLoading {
            // Do anything here...
        }
    }
    
    @ViewBuilder func CellView(_ item: String) -> some View {
        Text(item)
    }
    
    @ViewBuilder func LastCellView() -> some View {
        ProgressView()
            .padding()
    }
    
    @ViewBuilder func EmptyArrView() -> some View {
        Text("No items to display...")
    }
}

#Preview {
    CustomizedImplementation()
}
