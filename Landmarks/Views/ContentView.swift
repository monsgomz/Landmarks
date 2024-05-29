//
//  ContentView.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		LandmarkList()
	}
}

#Preview {
    ContentView()
		.environment(ModelData()) //Para hacer disponible a todas las vistas
}
