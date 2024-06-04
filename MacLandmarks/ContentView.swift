//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Montserrat Gomez on 2024-06-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		LandmarkList()
			.frame(minWidth: 700, minHeight: 300)
    }
}

#Preview {
    ContentView()
		.environment(ModelData())
}
