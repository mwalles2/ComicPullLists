//
//  AddComicView.swift
//  ComicPullLists
//
//  Created by Micah A. Walles on 3/1/24.
//

import SwiftUI
import SwiftData

struct AddComicView: View {
	@Environment(\.dismiss) var dismiss
	@Environment(\.modelContext) private var modelContext
	@State var title: String = ""
	@State var publishedDate: Date = Date()

	var body: some View {
		VStack {
			HStack{
				Text("Name")
				TextField("", text: $title)
			}
			HStack{
				DatePicker("Published", selection: $publishedDate, displayedComponents: [.date])
			}
			HStack{
				Spacer()
				Button("Cancel") {
					dismiss()
				}.padding()
				Button("Save") {
					let newItem = Comic(title: title, publishedDate: publishedDate)
					modelContext.insert(newItem)
					dismiss()
				}
			}
			Spacer()
		}.padding()
    }
}

#Preview {
    AddComicView()
}
