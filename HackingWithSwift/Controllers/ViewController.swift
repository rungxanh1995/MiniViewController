//
//  ViewController.swift
//  HackingWithSwift
//
//  Created by Paul Hudson on 08/11/2018.
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, Storyboarded {
	let projectListDataSource = ProjectListDataSource()
	weak var coordinator: MainCoordinator?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.dataSource = projectListDataSource
        title = "Hacking with Swift"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let project = projectListDataSource.project(at: indexPath.row)
		coordinator?.show(project)
    }
}

