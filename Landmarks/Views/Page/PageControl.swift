//
//  PageControl.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-06-03.
//

import SwiftUI
import UIKit


struct PageControl: UIViewRepresentable {
	var numberOfPages: Int
	@Binding var currentPage: Int
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	func makeUIView(context: Context) -> UIPageControl {
		let control = UIPageControl() //Serie de puntos que indican las paginas
		control.numberOfPages = numberOfPages
		control.addTarget(
			context.coordinator,
			action: #selector(Coordinator.updateCurrentPage(sender:)),
			for: .valueChanged)
		
		return control
	}
	
	
	func updateUIView(_ uiView: UIPageControl, context: Context) {
		uiView.currentPage = currentPage
	}
	
	class Coordinator: NSObject {
		var control: PageControl
		
		
		init(_ control: PageControl) {
			self.control = control
		}
		
		
		@objc
		func updateCurrentPage(sender: UIPageControl) {
			control.currentPage = sender.currentPage
		}
	}
	
}
