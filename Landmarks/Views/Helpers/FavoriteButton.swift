//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-28.
//

import SwiftUI

struct FavoriteButton: View {
	@Binding var isSet: Bool
	
    var body: some View {
		Button {
			isSet.toggle()
		} label: {
			Label("Favorite", systemImage: isSet ? "star.fill" : "star")
				.labelStyle(.iconOnly)
				.foregroundStyle(isSet ? .yellow : .gray)
		}
    }
}

#Preview {
	FavoriteButton(isSet: .constant(false))
}
