//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-29.
//

import SwiftUI

struct CategoryRow: View {
	var categoryName: String
	var items: [Landmark]
	
    var body: some View {
		VStack(alignment: .leading){
			Text(categoryName)
				.font(.headline)
				.padding(.leading, 15)
				.padding(.top, 15)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(alignment: .top, spacing: 0){
					ForEach(items){ item in
						NavigationLink {
							LandmarkDetail(landmark: item)
								
						} label: {
							CategoryItem(landmark: item)
						}
	
					}
				}
			}
		}
		.frame(height: 188)
		.padding([.bottom, .top], 10)
    }
}

#Preview {
	let landmarks = ModelData().landmarks
	return CategoryRow(
		categoryName: landmarks[0].category.rawValue,
		items: Array(landmarks.prefix(4))
	)
}
