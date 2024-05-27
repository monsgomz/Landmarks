//
//  MapView.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import SwiftUI
import MapKit

struct MapView: View {
	var coordinate: CLLocationCoordinate2D
	
    var body: some View {
		Map(position: .constant(.region(region))) //es constante porque no se necesita saber si se cambia el valor
    }
	
	//Variable que guarda la region de una ubicacion
	private var region: MKCoordinateRegion {
		MKCoordinateRegion(
			center: coordinate,
			span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
		)
	}
}

#Preview {
	MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
