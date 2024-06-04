//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Montserrat Gomez on 2024-06-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		LandmarkList()
    }
}

#Preview {
    ContentView()
		.environment(ModelData())
}
