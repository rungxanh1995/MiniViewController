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
	
	func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
		if let host = navigationAction.request.url?.host {
			if allowedSites.contains(where: host.contains) {
				decisionHandler(.allow)
				return
			} else {
				print("Disallowed invalid site: \(host).")
			}
		}
		decisionHandler(.cancel)
	}
}
