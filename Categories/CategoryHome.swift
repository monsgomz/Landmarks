//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-29.
//

import SwiftUI

struct CategoryHome: View {
	@Environment(ModelData.self) var modelData //para leer los datos
	
    var body: some View {
		NavigationSplitView {
			List {
				ForEach(modelData.categories.keys.sorted(), id: \.self){ category in
					Text(category)
				}
			}
				.navigationTitle("Featured")
		} detail: {
			Text("Select a Landmark")
		}
    }
}

#Preview {
    CategoryHome()
		.environment(ModelData())
}
