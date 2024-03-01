//
//  AddPersonView.swift
//  ComicPullLists
//
//  Created by Micah A. Walles on 3/1/24.
//

import SwiftUI
import SwiftData

struct AddPersonView: View {
	@Environment(\.dismiss) var dismiss
	@Environment(\.modelContext) private var modelContext
	@State var name: String = ""

    var body: some View {
		VStack {
			HStack{
				Text("Name")
				TextField("", text: $name)
			}
			HStack{
				Spacer()
				Button("Cancel") {
					dismiss()
				}.padding()
				Button("Save") {
					let newItem = Person(name: name)
					modelContext.insert(newItem)
					dismiss()
				}
			}
			Spacer()
		}.padding()
    }
}

#Preview {
    AddPersonView()
}
