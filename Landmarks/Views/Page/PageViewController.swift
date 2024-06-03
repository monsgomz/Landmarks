//
//  PageViewController.swift
//  Landmarks
//
//  Created by Montserrat Gomez on 2024-05-31.
/*
 To represent UIKit views and view controllers in SwiftUI, you create types that conform to the UIViewRepresentable and UIViewControllerRepresentable protocols. Your custom types create and configure the UIKit types that they represent, while SwiftUI manages their life cycle and updates them when needed.
 
 view controllers are objects used to manage UI views by responding to user input.
 They handle events such as button taps, gestures, and passing data to the views.
 */

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
	var pages: [Page]
	@Binding var currentPage: Int
	
	func makeCoordinator() -> Coordinator {
		Coordinator(self)
	}
	
	//Requerido por UIViewController, SwiftUI lo llama solo una vez
	func makeUIViewController(context: Context) -> UIPageViewController {
		let pageViewController = UIPageViewController(
			transitionStyle: .scroll,
			navigationOrientation: .horizontal)
		pageViewController.dataSource = context.coordinator
		pageViewController.delegate = context.coordinator
		
		return pageViewController
	}
	
	//Requerido por UIViewController
	func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
		pageViewController.setViewControllers(
			[context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
	}
	
	class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
		var parent: PageViewController
		var controllers = [UIViewController]()
		
		
		init(_ pageViewController: PageViewController) {
			parent = pageViewController
			controllers = parent.pages.map { UIHostingController(rootView: $0) }
		}
		
		
		func pageViewController(
			_ pageViewController: UIPageViewController,
			viewControllerBefore viewController: UIViewController) -> UIViewController?
		{
			guard let index = controllers.firstIndex(of: viewController) else {
				return nil
			}
			if index == 0 {
				return controllers.last
			}
			return controllers[index - 1]
		}
		
		
		func pageViewController(
			_ pageViewController: UIPageViewController,
			viewControllerAfter viewController: UIViewController) -> UIViewController?
		{
			guard let index = controllers.firstIndex(of: viewController) else {
				return nil
			}
			if index + 1 == controllers.count {
				return controllers.first
			}
			return controllers[index + 1]
		}
		
		func pageViewController(
			_ pageViewController: UIPageViewController,
			didFinishAnimating finished: Bool,
			previousViewControllers: [UIViewController],
			transitionCompleted completed: Bool) {
				if completed,
				   let visibleViewController = pageViewController.viewControllers?.first,
				   let index = controllers.firstIndex(of: visibleViewController) {
					parent.currentPage = index
				}
			}
		
	}
}
