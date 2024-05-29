//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-29.
//

import SwiftUI

struct CategoryItem: View {
	var landmark: Landmark //lee los datos
	
	var body: some View {
		VStack(alignment: .leading) {
			landmark.image
				.resizable()
				.frame(width: 155, height: 155)
				.cornerRadius(5)
			Text(landmark.name)
				.font(.caption)
		}
		.padding(.leading, 15)
	}
}

#Preview {
	CategoryItem(landmark: ModelData().landmarks[0])
}
