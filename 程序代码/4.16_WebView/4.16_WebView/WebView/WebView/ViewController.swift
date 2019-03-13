//
//  ViewController.swift
//  WebView
//
//  Created by 李巍 on 2018/10/28.
//  Copyright © 2018 李巍. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = UIWebView(frame: UIScreen.main.bounds)
        
        let url = URL(string: "https://www.apple.com/")
        let urlRequest = NSURLRequest(url: url!)
        webView.loadRequest(urlRequest as URLRequest)
        
        self.view.addSubview(webView)
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}

