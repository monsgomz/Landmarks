//
//  ContentView.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import SwiftUI

struct ContentView: View {
	@State private var selection: Tab = .featured
	
	enum Tab {
		case featured
		case list
	}
	
	var body: some View {
		TabView {
			CategoryHome()
				.tabItem { Label("Featured", systemImage: "sparkles") }
				.tag(Tab.featured)
			LandmarkList()
				.tabItem { Label("List", systemImage: "list.bullet.rectangle.fill") }
				.tag(Tab.list)
		}
	}
}

#Preview {
    ContentView()
		.environment(ModelData()) //Para hacer disponible a todas las vistas
}
