//
//  MapView.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
		Map(initialPosition: .region(region))
    }
	
	//Variable que guarda la region de una ubicacion
	private var region: MKCoordinateRegion {
		MKCoordinateRegion(
			center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
			span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
		)
	}
}

#Preview {
    MapView()
}
