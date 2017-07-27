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
        let navBackgroundImage:UIImage! = UIImage(named: "logo")
        let imgView = UIImageView(image: navBackgroundImage)
        self.navigationItem.titleView = imgView
        self.navigationItem.hidesBackButton = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "background"), for: .default)
        
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "arrow"), for: UIControlState.normal)
        button.addTarget(self, action:#selector(btnBck), for: UIControlEvents.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 30, height: 30)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
    }

    func btnBck() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
