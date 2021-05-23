//
//  ProjectListDataSource.swift
//  HackingWithSwift
//
//  Created by Joe Pham on 2021-05-22.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import UIKit

class ProjectListDataSource: NSObject, UITableViewDataSource {
	private var projects: [Project] = Bundle.main.decode(from: "projects.json")
	
	func project(at row: Int) -> Project {
		return projects[row]
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return projects.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let project = projects[indexPath.row]
		cell.textLabel?.attributedText = project.attributedString
		return cell
	}

}
