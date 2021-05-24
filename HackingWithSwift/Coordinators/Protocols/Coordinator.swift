//
//  Coordinator.swift
//  HackingWithSwift
//
//  Created by Joe Pham on 2021-05-23.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import UIKit

protocol Coordinator {
	var children: [Coordinator] { get set }
	var navigationController: UINavigationController { get set }
	
	func start()
}
