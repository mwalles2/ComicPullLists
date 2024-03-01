//
//  PersonView.swift
//  ComicPullLists
//
//  Created by Micah A. Walles on 2/29/24.
//

import SwiftUI
import SwiftData

struct PersonListView: View {
	@Environment(\.modelContext) private var modelContext
	@Query private var persons: [Person]
	@State var presentAddSheet: Bool = false
	
	var body: some View {
		NavigationSplitView {
			List {
				ForEach(persons) { person in
					NavigationLink {
						PersonView(person: person)
					} label: {
						Text(person.name)
					}
				}
				.onDelete(perform: deleteItems)
			}
			.toolbar {
				ToolbarItem {
					Button {
						presentAddSheet = true
					} label: {
						Label("Add Person", systemImage: "plus")
					}
				}
			}
		} detail: {
			Text("Select an item")
		}.popover(isPresented: $presentAddSheet) {
			AddPersonView()
		}
	}
	
	private func deleteItems(offsets: IndexSet) {
		withAnimation {
			for index in offsets {
				modelContext.delete(persons[index])
			}
		}
	}
}
