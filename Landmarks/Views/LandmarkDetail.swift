//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import SwiftUI

struct LandmarkDetail: View {
	var landmark: Landmark
	
    var body: some View {
		ScrollView {
			VStack {
				MapView(coordinate: landmark.locationCoordinate)
					.frame(height: 300)
				CircleImage(image: landmark.image)
					.offset(y: -130)
					.padding(.bottom, -130)
				
				VStack(alignment: .leading) {
					Text(landmark.name)
						.font(.title)
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

#Preview {
	LandmarkDetail(landmark: landmarks[0])
}