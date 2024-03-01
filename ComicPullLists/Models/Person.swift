//
//  Person.swift
//  ComicPullLists
//
//  Created by Micah A. Walles on 2/29/24.
//

import Foundation
import SwiftData

@Model
final class Person {
	var name: String
	var comics: [Comic]
	
	internal init(name: String, comics: [Comic] = [Comic]()) {
		self.name = name
		self.comics = comics
	}

	internal func add(comic: Comic) {
		comics.append(comic)
	}
}
