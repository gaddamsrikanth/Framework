//
//  scanImageController.swift
//  Framework
//
//  Created by Developer88 on 7/19/17.
//  Copyright © 2017 Developer88. All rights reserved.
//

import UIKit
import AVFoundation

public class scanImageController: UIViewController {
    
    @IBOutlet var viewCamera: UIView!
    
    @IBOutlet var bgView: UIView!

    override public func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(detectImage(_:)), name: NSNotification.Name(rawValue: "detectImage"), object: nil)
    }
    
    public override func viewDidLayoutSubviews() {
        bgView.backgroundColor = ViewController1.bgColor
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        ViewController1.cameraView.view.frame = CGRect(x: 20, y: 20, width: 200, height: 200)
        print(ViewController1.cameraView)
        let cv = CVWrapper()
        let resourcesBundle = cv.beginProcess()
//        navigationController?.pushViewController(resourcesBundle!, animated: true)
        self.addChildViewController(ViewController1.cameraView)
        self.view.addSubview(ViewController1.cameraView.view)
    }
    
    func detectImage(_ notification: NSNotification) {
        print(notification.object as! String)
        if(!(notification.object as! String).isEmpty) {
            WebViewVC.Viewurl = notification.object as! String
        }
    }
    
}
