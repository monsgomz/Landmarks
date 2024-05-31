//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-29.
//

import SwiftUI

struct CategoryHome: View {
	@Environment(ModelData.self) var modelData //para leer los datos
	@State private var showingProfile: Bool = false
	
    var body: some View {
		NavigationSplitView {
			
			List {
				modelData.features[0].image
					.resizable()
					.scaledToFill()
					.frame(height: 200)
					.clipped()
					.listRowInsets(EdgeInsets())
				
				ForEach(modelData.categories.keys.sorted(), id: \.self){ key in
					CategoryRow(categoryName: key, items: modelData.categories[key]!)
						.padding(.bottom, 12)
				}
				.listRowInsets(EdgeInsets()) //MARK: revisar como funciona
				
			}
			.listStyle(.inset)
			.navigationTitle("Featured")
			.toolbar(content: {
				Button(action: {
					showingProfile.toggle()
				}, label: {
					Label("Perfil", systemImage: "person.crop.circle")
				})
			})
			.sheet(isPresented: $showingProfile, content: {
				ProfileHost()
					.environment(modelData)
			})
			
		} detail: {
			Text("Select a Landmark")
		}
	}
}

#Preview {
    CategoryHome()
		.environment(ModelData())
}
