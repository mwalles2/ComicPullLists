//
//  PersonView.swift
//  ComicPullLists
//
//  Created by Micah A. Walles on 3/1/24.
//

import SwiftUI

struct PersonView: View {
	@Environment(\.modelContext) private var modelContext
	var person: Person
	@State var presentAddSheet: Bool = false
	
	var body: some View {
		VStack {
			Text(person.name).font(.largeTitle)
			HStack {
				Text("Comics").font(.headline)
				Spacer()
				Button {
					presentAddSheet = true
				} label: {
					Label("Add comics", systemImage: "plus")
				}
				
			}.padding()
			Divider()
			List {
				ForEach(person.comics) { comic in
					ComicRowView(comic: comic)
				}
			}.listStyle(.plain)
		}.sheet(isPresented: $presentAddSheet, content: {
			AddComicsToPersonView(person: person)
		})
	}
}

#Preview {
	PersonView(person: Person(name: "Bob Jones"))
}
