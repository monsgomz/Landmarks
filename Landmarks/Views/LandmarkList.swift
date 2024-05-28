//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import SwiftUI

struct LandmarkList: View {
	@State private var showFavoritesOnly = false //private porque es especifica para la vista
	
	var filteredLandmarks: [Landmark] {
		landmarks.filter { landmark in
			(!showFavoritesOnly || landmark.isFavorite)
		}
	}
	
	var body: some View {
		NavigationSplitView {
			List(filteredLandmarks){ item in //se añade el campo id si no esta en el modelo
				NavigationLink{
					LandmarkDetail(landmark: item)
				} label: {
					LandmarkRow(landmark: item)
				}
			}
			.navigationTitle("Landmarks")
		}
		detail: { //solo se muestra en iPad
			Text("Select a Landmark")
		}
	}
}

#Preview {
	LandmarkList()
}
