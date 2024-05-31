//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-30.
//

import SwiftUI
//Esta es una sheet

struct ProfileHost: View {
	@Environment(\.editMode) var editMode //MARK: Revisar funcionamiento
	@State private var defaultProfile: Profile = .default
	@Environment(ModelData.self) var modelData //Para leer el perfil del usuario
	
    var body: some View {
		VStack(spacing: 20){
			HStack{
				Spacer()
				EditButton()
			}
			
			if editMode?.wrappedValue == .inactive {
				ProfileSummary(profile: modelData.profile)
				
			} else { //Cuando se da clic en edit mode
				ProfileEditor(profile: $defaultProfile)//Esto se muestra
			}
			
		}
		.padding()
    }
}

#Preview {
    ProfileHost()
		.environment(ModelData()) //porque una de sus vistas hijas lo usa
	
}
