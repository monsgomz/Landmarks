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
	
	private var imageName: String //no se utiliza en otro codigo
	var image: Image {
		Image(imageName)
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

