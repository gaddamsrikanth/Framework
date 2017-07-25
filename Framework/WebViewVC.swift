//
//  WebViewVC.swift
//  Framework
//
//  Created by Developer88 on 7/20/17.
//  Copyright © 2017 Developer88. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    static var Viewurl : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.loadRequest(NSURLRequest(url: NSURL(string: WebViewVC.Viewurl)! as URL) as URLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
