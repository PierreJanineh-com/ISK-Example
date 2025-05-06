//
//  CustomizedImplementation.swift
//  ISK Example
//
//  Created by Pierre Janineh on 21/09/2024.
//

import SwiftUI
import InfinityScrollKit

struct CustomizedImplementation: View {
    @State private var arr: [Person] = []
    @State private var isLoading: Bool = false
    
    var body: some View {
        InfiniteScrollView(
            arr: $arr,
            options: options,
            onLoadingChanged: onLoadingChanged,
            cellView: CellView,
            lastCellView: LastCellView,
            emptyArrView: EmptyArrView
        )
    }
    
    private var options: Options<Person> {
        .init(
            orientation: .horizontal,
            countPerPage: 2,
            paginationOptions: .init(
                concatMode: .manual, // manual for manually appending items to the array and returning the whole array
                onPageLoad: {
                    // Simulate an http request
                    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    
                    var arr = await arr
                    for i in arr.count...arr.count + 10 {
                        arr.append(.init(name: "Cell #\(i)"))
                    }
                    return arr
                },
                onRefresh: {
                    // Simulate an http request
                    try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
                    
                    var arr = await arr
                    for i in 0...25 {
                        arr.append(.init(name: "Cell #\(i)"))
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
    
	@ViewBuilder func CellView(_ item: Person) -> some View {
		Text(item.name)
    }
    
    @ViewBuilder private func LastCellView() -> some View {
        ProgressView()
            .padding()
    }
    
    @ViewBuilder private func EmptyArrView() -> some View {
        Text("No items to display...")
    }
}

#Preview {
    CustomizedImplementation()
}

struct Person: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
}
