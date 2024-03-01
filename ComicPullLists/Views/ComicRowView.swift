//
//  ComicRowView.swift
//  ComicPullLists
//
//  Created by Micah A. Walles on 3/1/24.
//

import SwiftUI

struct ComicRowView: View {
	let comic: Comic
	
	var body: some View {
		VStack(alignment: .leading) {
			Text(comic.title).font(.headline)
			Text(comic.publishedDate.formatted(date: .long, time: .omitted)).font(.subheadline)
		}
	}
}

#Preview {
	ComicRowView(comic: Comic(title: "New Comic"))
}
