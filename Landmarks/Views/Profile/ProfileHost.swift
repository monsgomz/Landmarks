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
			//Top bar
			HStack {
				if editMode?.wrappedValue == .active {
					Button("Cancel", role: .cancel) {
						defaultProfile = modelData.profile
						editMode?.animation().wrappedValue = .inactive
					}
				}
				
				Spacer()
				EditButton()
			}
			 //contenido
			if editMode?.wrappedValue == .inactive {
				ProfileSummary(profile: modelData.profile)
				
			} else { //Cuando se da clic en edit mode
				ProfileEditor(profile: $defaultProfile)//Esto se muestra
					.onAppear {
						defaultProfile = modelData.profile //Tomar el valor de la BD
					}
					.onDisappear {
						modelData.profile = defaultProfile //Actualiza la BD
					}
			}
			
		}
		.padding()
    }
}

#Preview {
    ProfileHost()
		.environment(ModelData()) //porque una de sus vistas hijas lo usa
	
}
