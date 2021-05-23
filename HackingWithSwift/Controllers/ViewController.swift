//
//  ViewController.swift
//  HackingWithSwift
//
//  Created by Paul Hudson on 08/11/2018.
//  Copyright © 2018 Hacking with Swift. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
	let projectListDataSource = ProjectListDataSource()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.dataSource = projectListDataSource
        title = "Hacking with Swift"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let project = projectListDataSource.project(at: indexPath.row
		)

        guard let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        detailVC.project = project
        navigationController?.pushViewController(detailVC, animated: true)
    }

}

