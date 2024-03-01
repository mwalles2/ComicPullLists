//
//  ContentView.swift
//  ComicPullLists
//
//  Created by Micah A. Walles on 2/29/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	@Environment(\.modelContext) private var modelContext
	//    @Query private var items: [Item]
	
	var body: some View {
		TabView {
			PersonListView()
				.tabItem {
					Image(systemName: "person.fill")
					Text("People")
				}
			ComicListView()
				.tabItem {
					Image(systemName: "book.fill")
					Text("Comics")
				}
		}
	}
}

#Preview {
	ContentView()
}
