//
//  ComicListView.swift
//  ComicPullLists
//
//  Created by Micah A. Walles on 2/29/24.
//

import SwiftUI
import SwiftData

struct ComicListView: View {
	@Environment(\.modelContext) private var modelContext
	@Query private var comics: [Comic]
	@State var presentAddSheet: Bool = false
	
	var body: some View {
		VStack {
			if comics.count > 0 {
				NavigationView {
					List {
						ForEach(comics) { comic in
							ComicRowView(comic: comic)
						}
						.onDelete(perform: deleteItems)
					}
					.toolbar {
						ToolbarItem {
							Button {
								presentAddSheet = true
							} label: {
								Label("Add Comic", systemImage: "plus")
							}
						}
					}
				}
			} else {
				VStack {
					Text("Curently no comics.")
					Button("Add Comic") {
						presentAddSheet = true
					}
				}
			}
		}
		.popover(isPresented: $presentAddSheet) {
			AddComicView()
		}
	}
	
	private func deleteItems(offsets: IndexSet) {
		withAnimation {
			for index in offsets {
				modelContext.delete(comics[index])
			}
		}
	}
}
