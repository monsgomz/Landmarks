//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import SwiftUI

struct LandmarkDetail: View {
	@Environment(ModelData.self) var modelData
	
	var landmark: Landmark
	var landmarkIndex: Int {
		modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
	}
	
    var body: some View {
		@Bindable var modelData = modelData
		
		ScrollView {
			VStack {
				MapView(coordinate: landmark.locationCoordinate)
					.frame(height: 300)
				CircleImage(image: landmark.image)
					.offset(y: -130)
					.padding(.bottom, -130)
				
				VStack(alignment: .leading) {
					HStack {
						Text(landmark.name)
							.font(.title)
						FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
					}
					HStack {
						Text(landmark.park)
							.font(.subheadline)
						Spacer()
						Text(landmark.state)
							.font(.subheadline)
					}
					.font(.subheadline)
					.foregroundStyle(.secondary)
					Divider()
					
					Text(landmark.name)
						.font(.title2)
					Text(landmark.description)
				}
				.padding()
				
			}
			.navigationTitle(landmark.name)
			.navigationBarTitleDisplayMode(.inline)
		}
    }
}

//MARK: Revisar que todos los preview tengan enviroment 
#Preview {
	let modelData = ModelData()
	return LandmarkDetail(landmark: modelData.landmarks[0])
		.environment(modelData) //para que se muestre el preview
}
