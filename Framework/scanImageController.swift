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
    @IBOutlet var lblPointCam: UILabel!
    

    override public func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(detectImage(_:)), name: NSNotification.Name(rawValue: "detectImage"), object: nil)
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
        localization()
    }
    
    public override func viewDidLayoutSubviews() {
        bgView.backgroundColor = ViewController1.bgColor
        viewCamera.layer.cornerRadius = 5
        viewCamera.layer.borderWidth = 5
        viewCamera.layer.borderColor = UIColor.white.cgColor
        
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        ViewController1.cameraView.view.frame = CGRect(x: viewCamera.frame.origin.x, y: viewCamera.frame.origin.y, width: UIScreen.main.bounds.size.width - 42, height: UIScreen.main.bounds.size.height - viewCamera.frame.origin.y - 20)
        print(ViewController1.cameraView)
//        let cv = CVWrapper()
//        let resourceBundle : Bundle = Bundle(identifier: "com.Framework")!

//        self.navigationController?.pushViewController(cv.beginProcess(), animated: true)
//        self.navigationController?.pushViewController(UIViewController(nibName: "CloudRecoViewController", bundle: resourceBundle), animated: true)
        self.addChildViewController(ViewController1.cameraView)
        self.view.addSubview(ViewController1.cameraView.view)
    }
    
    func btnBck() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func localization() -> Void {
        let bundle: Bundle = Bundle(identifier: "com.Framework")!
        
        lblPointCam.text = NSLocalizedString("Point camera at a product on the ad", tableName: nil , bundle: bundle, value: "", comment: "")
    }
    
    func detectImage(_ notification: NSNotification) {
        print(notification.object as! String)
        if(!(notification.object as! String).isEmpty) {
            WebViewVC.Viewurl = notification.object as! String
        }
    }
    
}
