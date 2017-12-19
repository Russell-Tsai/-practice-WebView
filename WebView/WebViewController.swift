//
//  WebViewController.swift
//  WebView
//
//  Created by 蔡松樺 on 19/12/2017.
//  Copyright © 2017 蔡松樺. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    var webView : WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "http://www.appcoda.com/contact") {
            let request = URLRequest(url: url)
            webView.load(request)
        }

    }
    //此方法在 ViewDidLoad 建構 ViewController 之前被呼叫
    override func loadView() {
        webView = WKWebView()
        self.view = webView
    }


}
