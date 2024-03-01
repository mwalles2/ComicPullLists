//
//  Title.swift
//  ComicPullLists
//
//  Created by Micah A. Walles on 2/29/24.
//

import Foundation
import SwiftData

@Model
final class Comic {
	var title: String
	var publishedDate: Date
	
	internal init(title: String, publishedDate: Date = Date()) {
		self.title = title
		self.publishedDate = publishedDate
	}
}
