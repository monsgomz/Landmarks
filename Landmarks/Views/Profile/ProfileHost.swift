//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-30.
//

import SwiftUI

struct ProfileHost: View {
	@State private var defaultProfile: Profile = .default
	
    var body: some View {
		VStack(spacing: 20){
			ProfileSummary(profile: defaultProfile)
		}
		.padding()
    }
}

#Preview {
    ProfileHost()
}
