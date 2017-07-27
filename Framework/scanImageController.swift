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
        localization()
        let bundle: Bundle = Bundle(identifier: "com.Framework")!
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "arrow", in: bundle, compatibleWith: nil), for: UIControlState.normal)
        button.addTarget(self, action:#selector(btnBck), for: UIControlEvents.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 15, height: 15)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        bgView.backgroundColor = ViewController1.bgColor
        var navBackgroundImage:UIImage! = UIImage(named: "logo", in: bundle, compatibleWith: nil)
        navBackgroundImage = resizeImage(image: navBackgroundImage, newHeight: 40)
        let imgView = UIImageView(image: navBackgroundImage)
        imgView.frame = CGRect.init(x: 100, y: 0, width: 135, height: 40)
        self.navigationItem.titleView = imgView
        
    }
    
    public override func viewDidLayoutSubviews() {
        bgView.backgroundColor = ViewController1.bgColor
        viewCamera.clipsToBounds = true
        viewCamera.layer.cornerRadius = 20
        viewCamera.layer.borderWidth = 20
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
    
    func resizeImage(image: UIImage, newHeight: CGFloat) -> UIImage {
        let scale = newHeight / image.size.height
        let newWidth = image.size.width * scale
        UIGraphicsBeginImageContext(CGSize(width :newWidth,height: newHeight))
        image.draw(in: CGRect(x: 0,y:0,width : newWidth,height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
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
