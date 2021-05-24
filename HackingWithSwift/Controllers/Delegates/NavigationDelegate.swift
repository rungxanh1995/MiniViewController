//
//  NavigationDelegate.swift
//  HackingWithSwift
//
//  Created by Joe Pham on 2021-05-22.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import WebKit

class NavigationDelegate: NSObject, WKNavigationDelegate {
	private let allowedSites = ["apple.com", "hackingwithswift.com"]
	
	func isAllowed(_ url: URL?) -> Bool {
		guard let host = url?.host else { return false }
		if allowedSites.contains(where: host.contains) {
			return true
		}
		return false
	}
	
	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
		if isAllowed(navigationAction.request.url) {
			decisionHandler(.allow)
		} else {
			decisionHandler(.cancel)
		}
	}
}
