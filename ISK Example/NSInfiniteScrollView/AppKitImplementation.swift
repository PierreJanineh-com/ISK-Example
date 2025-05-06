//
//  AppKitImplementation.swift
//  ISK Example
//
//  Created by Pierre Janineh on 06/05/2025.
//

#if os(macOS)
import SwiftUI
import InfinityScrollKit

/// Dummy SwiftUI wrapper for the UIKit.
struct AppKitImplementation: NSViewRepresentable {
	private var infiniteScroll: NSInfiniteScrollView<Person, Self> = .init(items: [])
	private var persons: [Person] { infiniteScroll.items }
	
	func makeNSView(context: Context) -> NSInfiniteScrollView<Person, Self> {
		infiniteScroll.options = .init(
			orientation: .vertical,
			countPerPage: 2,
			paginationOptions: .init(
				concatMode: .manual, // manual for manually appending items to the array and returning the whole array
				onPageLoad: {
					// Simulate an http request
					try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
					
					var arr = await persons
					for i in arr.count...arr.count + 10 {
						arr.append(.init(name: "Cell #\(i)"))
					}
					return arr
				},
				onRefresh: {
					// Simulate an http request
					try? await Task.sleep(nanoseconds: 5 * 1_000_000_000)
					
					var arr = await persons
					for i in 0...25 {
						arr.append(.init(name: "Cell #\(i)"))
					}
					return arr
				}
			)
		)
		infiniteScroll.delegate = self
		return infiniteScroll
	}
	
	func updateNSView(
		_ uiView: NSInfiniteScrollView<Person, Self>, context: Context
	) { }
}

extension AppKitImplementation: NSInfiniteScrollViewDelegate {
	func cellFor(_ item: Person, at: IndexPath.Index) -> NSView {
		let label = NSTextField(labelWithString: item.name)
		label.alignment = .center
		return label
	}
}
#endif
