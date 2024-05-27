//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-27.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
		List(landmarks, id: \.id){ item in
			LandmarkRow(landmark: item)
		}
    }
}

#Preview {
    LandmarkList()
}
