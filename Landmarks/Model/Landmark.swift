//
//  Landmark.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import Foundation
import SwiftUI
import CoreLocation //para obtener la ubicacion del dispositivo

struct Landmark: Hashable, Codable, Identifiable{
	var id: Int
	var name: String
	var park: String
	var state: String
	var description: String
	var isFavorite: Bool
	var isFeatured: Bool
	
	var category: Category
	enum Category: String, CaseIterable, Codable {
		case lakes = "Lakes"
		case rivers = "Rivers"
		case mountains = "Mountains"
	}
	
	private var imageName: String //no se utiliza en otro codigo
	var image: Image {
		Image(imageName)
	}
	
	var featureImage: Image? {
		isFeatured ? Image(imageName + "_feature") : nil
	}
	
	private var coordinates: Coordinates
	var locationCoordinate: CLLocationCoordinate2D {
		CLLocationCoordinate2D(
			latitude: coordinates.latitude,
			longitude: coordinates.longitude)
	}
	
	struct Coordinates: Hashable, Codable {
		var latitude: Double
		var longitude: Double
	}
}

