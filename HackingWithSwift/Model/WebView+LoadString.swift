//
//  WebView+LoadString.swift
//  HackingWithSwift
//
//  Created by Joe Pham on 2021-05-22.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import WebKit

extension WKWebView {
	func load(_ urlString: String) {
		guard let url = URL(string: urlString) else { return }
		let request = URLRequest(url: url)
		load(request)
	}
}
