//
//  DetailView.swift
//  HackingWithSwift
//
//  Created by Joe Pham on 2021-05-22.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import UIKit

class DetailView: UIView {
	typealias ReadAction = () -> Void
	private var readAction: ReadAction?
	
	init(of project: Project, readAction: @escaping ReadAction) {
		self.readAction = readAction
		super.init(frame: .zero)	// this view takes up all space
									// in its view controller
		backgroundColor = .white
		
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(scrollView)
		
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .vertical
		scrollView.addSubview(stackView)
		
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
			
			stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
			stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
			stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 20),
			stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
		])
		
		let titleLabel = UILabel()
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
		titleLabel.numberOfLines = 0
		titleLabel.text = project.title
		titleLabel.textColor = .black
		
		let detailLabel = UILabel()
		detailLabel.translatesAutoresizingMaskIntoConstraints = false
		detailLabel.numberOfLines = 0
		detailLabel.font = UIFont.preferredFont(forTextStyle: .body)
		detailLabel.text = project.subtitle
		detailLabel.textColor = .black
		
		let learnTitleLabel = UILabel()
		learnTitleLabel.translatesAutoresizingMaskIntoConstraints = false
		learnTitleLabel.numberOfLines = 0
		learnTitleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
		learnTitleLabel.text = "You'll learn…"
		learnTitleLabel.textColor = .black
		
		let learnDetailLabel = UILabel()
		learnDetailLabel.translatesAutoresizingMaskIntoConstraints = false
		learnDetailLabel.numberOfLines = 0
		learnDetailLabel.font = UIFont.preferredFont(forTextStyle: .body)
		learnDetailLabel.text = project.topics
		learnDetailLabel.textColor = .black
		
		let showButton = UIButton(type: .system)
		showButton.translatesAutoresizingMaskIntoConstraints = false
		showButton.setTitle("Start Reading", for: .normal)
		showButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
		showButton.addTarget(self, action: #selector(readProject), for: .touchUpInside)
		
		stackView.addArrangedSubview(titleLabel)
		stackView.addArrangedSubview(detailLabel)
		stackView.addArrangedSubview(learnTitleLabel)
		stackView.addArrangedSubview(learnDetailLabel)
		stackView.addArrangedSubview(showButton)
		
		stackView.setCustomSpacing(40, after: detailLabel)
		stackView.setCustomSpacing(40, after: learnDetailLabel)
	}
	
	@objc
	func readProject() {
		readAction?()
		// real functionality is passed in from the view controller
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
