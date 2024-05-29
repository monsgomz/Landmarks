//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import SwiftUI

@main
struct LandmarksApp: App {
	@State private var modelData = ModelData() //para inicializar la instancia del modelo
	
    var body: some Scene {
        WindowGroup {
            ContentView()
				.environment(modelData) //pasarla al contentview
        }
    }
}
