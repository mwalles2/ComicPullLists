//
//  AddComicsView.swift
//  ComicPullLists
//
//  Created by Micah A. Walles on 3/1/24.
//

import SwiftUI
import SwiftData

struct AddComicsToPersonView: View {
	@Environment(\.dismiss) var dismiss
	@Environment(\.modelContext) private var modelContext
	@Query private var comics: [Comic]
	var person: Person

	var body: some View {
		List {
			ForEach(comics) { comic in
				HStack {
					ComicRowView(comic: comic)
					Spacer()
					Button("Add") {
						person.add(comic: comic)
						dismiss()
					}
				}
			}
		}
	}
}
