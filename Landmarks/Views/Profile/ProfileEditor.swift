//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-31.
//

import SwiftUI

struct ProfileEditor: View {
	
	@Binding var profile: Profile
	var dateRange: ClosedRange<Date> {
		let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
		let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
		return min...max
	}
	
    var body: some View {
		List {
			HStack {
				Text("Username")
				Spacer()
				TextField("Username", text: $profile.username)
					.foregroundStyle(.secondary)
					.multilineTextAlignment(.trailing)
			}
			
			Toggle("Enable notifications", isOn: $profile.prefersNotifications)
			
			Picker(selection: $profile.seasonalPhoto, label: Text("Seasonal Photo")) {
				ForEach(Profile.Season.allCases){ item in
					Text(item.rawValue)
						.tag(item) //MARK: Revisar porque
					
				}
			}
			//MARK: Revisar y practicar
			DatePicker(selection: $profile.goalDate, in: dateRange, displayedComponents: .date) {
				Text("Goal Date")
			}

		}
    }
}

#Preview {
	ProfileEditor(profile: .constant(.default))
}
