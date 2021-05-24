//
//  MainCoordinator.swift
//  HackingWithSwift
//
//  Created by Joe Pham on 2021-05-23.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
	var children = [Coordinator]()
	
	var navigationController: UINavigationController
	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}
	
	func start() {
		let vc = ViewController.instantiate()
		vc.coordinator = self
		navigationController.pushViewController(vc, animated: false)
	}
	
	func show(_ project: Project) {
		let detailVC = DetailViewController.instantiate()
		detailVC.coordinator = self
		detailVC.project = project
		navigationController.pushViewController(detailVC, animated: true)
	}
	
	func read(_ project: Project) {
		let readVC = ReadViewController.instantiate()
		readVC.project = project
		navigationController.pushViewController(readVC, animated: true)
	}
}
