//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import SwiftUI

struct LandmarkList: View {
	@Environment(ModelData.self) var modelData
	@State private var showFavoritesOnly = false //private porque es especifica para la vista
	
	var filteredLandmarks: [Landmark] {
		modelData.landmarks.filter { landmark in
			(!showFavoritesOnly || landmark.isFavorite)
		}
	}
	
	/*
	 To combine static and dynamic views in a list, or to combine two or more different groups of dynamic views, use the ForEach type instead of passing your collection of data to List.
	 */
	
var body: some View {
	NavigationSplitView {
		List {
			Toggle(isOn: $showFavoritesOnly, label: {
				Text("Favorites")
			})
			ForEach(filteredLandmarks) { landmark in
				NavigationLink {
					LandmarkDetail(landmark: landmark)
				} label: {
					LandmarkRow(landmark: landmark)
				}
			}
		}
		.navigationTitle("Landmarks")
		.animation(.default, value: filteredLandmarks)
	} detail: {
		Text("Select a Landmark")
	}
}
}

#Preview {
	LandmarkList()
}
