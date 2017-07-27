//
//  ViewController.swift
//  Framework
//
//  Created by Developer88 on 7/19/17.
//  Copyright © 2017 Developer88. All rights reserved.
//

import UIKit

public class ViewController1: UIViewController{
    
    public static var cameraView : UIViewController!
    static var bgColor : UIColor! = #colorLiteral(red: 0.8564705253, green: 0.123423703, blue: 0.1560736001, alpha: 1)
    static var btnColor : UIColor! = #colorLiteral(red: 0.6306080222, green: 0.07898784429, blue: 0.0982254222, alpha: 1)
    static var txtColor : UIColor! = #colorLiteral(red: 0.9737131134, green: 0.9737131134, blue: 0.9737131134, alpha: 1)
    
    @IBOutlet var btnScan: UIButton!
    @IBOutlet var lbladReaderHome: UILabel!
    @IBOutlet var lblusrManual: UILabel!
    @IBOutlet var lblInstruction: UILabel!
    @IBOutlet var bgView: UIView!
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        let cvWrap = CVWrapper()

        ViewController1.cameraView = cvWrap.beginProcess()
        localization()
        
        let bundle: Bundle = Bundle(identifier: "com.Framework")!
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "arrow", in: bundle, compatibleWith: nil), for: UIControlState.normal)
        button.addTarget(self, action:#selector(bckBtn), for: UIControlEvents.touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 15, height: 15)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        var navBackgroundImage:UIImage! = UIImage(named: "logo", in: bundle, compatibleWith: nil)
        navBackgroundImage = resizeImage(image: navBackgroundImage, newHeight: 40)
        let imgView = UIImageView(image: navBackgroundImage)
        imgView.frame = CGRect.init(x: 100, y: 0, width: 135, height: 40)
        self.navigationItem.titleView = imgView
        
        self.btnScan.layer.cornerRadius = self.btnScan.frame.height / 2
        bgView.backgroundColor = ViewController1.bgColor
        btnScan.backgroundColor = ViewController1.btnColor
        lblusrManual.textColor = ViewController1.txtColor
        lblInstruction.textColor = ViewController1.txtColor
        lbladReaderHome.textColor = ViewController1.txtColor
        btnScan.setTitleColor(ViewController1.txtColor, for: .normal)
        
        
    }
    
    public override func viewWillAppear(_ animated: Bool) {
           }
    
    public override func viewDidLayoutSubviews() {
        
//        self.navigationController?.navigationBar.tintColor = UIColor.lightGray
        
    }
    
    @IBAction func openImagescan(_ sender: Any) {
        let bundle = Bundle(for: scanImageController.self)
        let vc = scanImageController(nibName: "scanImageController", bundle: bundle)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func localization() -> Void {
        
        let bundle: Bundle = Bundle(identifier: "com.Framework")!
        
        btnScan.setTitle(NSLocalizedString("Start", tableName: nil , bundle: bundle, value: "", comment: ""), for: .normal)
        
        lbladReaderHome.text = NSLocalizedString("Ad reader Of Home Center", tableName: nil , bundle: bundle, value: "", comment: "")
        
        
        lblusrManual.text = NSLocalizedString("User manual:", tableName: nil , bundle: bundle, value: "", comment: "")
        
        lblInstruction.text = NSLocalizedString("Set the camera toward a picture of a product Home Center ads are printed and received information More detailed, more photos, and even videos On the product.", tableName: nil , bundle: bundle, value: "", comment: "")
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
    
    func bckBtn() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
