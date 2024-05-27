//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import SwiftUI

struct LandmarkRow: View {
	var landmark: Landmark
	
    var body: some View {
		HStack{
			landmark.image
				.resizable()
				.frame(width: 50, height: 50, alignment: .center)
			Text(landmark.name)
			Spacer()
		}
    }
}

#Preview{
	Group{
		LandmarkRow(landmark: landmarks[0])
		LandmarkRow(landmark: landmarks[3])
	}
    
}
