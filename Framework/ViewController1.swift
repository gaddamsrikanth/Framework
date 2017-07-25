//
//  ViewController.swift
//  Framework
//
//  Created by Developer88 on 7/19/17.
//  Copyright © 2017 Developer88. All rights reserved.
//

import UIKit

public class ViewController1: UIViewController{
    
    static var cameraView : UIViewController!
    static var bgColor : UIColor! = #colorLiteral(red: 0.8564705253, green: 0.123423703, blue: 0.1560736001, alpha: 1)
    static var btnColor : UIColor! = #colorLiteral(red: 0.6306080222, green: 0.07898784429, blue: 0.0982254222, alpha: 1)
    static var txtColor : UIColor! = #colorLiteral(red: 0.9737131134, green: 0.9737131134, blue: 0.9737131134, alpha: 1)
    static var language : String! = "en"
    
    @IBOutlet var btnScan: UIButton!
    @IBOutlet var lbladReaderHome: UILabel!
    @IBOutlet var lblusrManual: UILabel!
    @IBOutlet var lblInstruction: UILabel!
    @IBOutlet var bgView: UIView!
    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        ViewController1.language = "iw"
        let cvWrap = CVWrapper()
        ViewController1.cameraView = cvWrap.beginProcess()
        localization()
    }
    
    public override func viewDidLayoutSubviews() {
        self.btnScan.layer.cornerRadius = self.btnScan.frame.height / 2
        bgView.backgroundColor = ViewController1.bgColor
        btnScan.backgroundColor = ViewController1.btnColor
        lblusrManual.textColor = ViewController1.txtColor
        lblInstruction.textColor = ViewController1.txtColor
        lbladReaderHome.textColor = ViewController1.txtColor
        btnScan.setTitleColor(ViewController1.txtColor, for: .normal)
    }
    
    @IBAction func openImagescan(_ sender: Any) {
        let bundle = Bundle(for: scanImageController.self)
        let vc = scanImageController(nibName: "scanImageController", bundle: bundle)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func localization() -> Void {
        btnScan.setTitle("START".localized(lang: ViewController1.language), for: .normal)
        lbladReaderHome.text = "AD_READER".localized(lang: ViewController1.language)
        lblusrManual.text = "MANUAL".localized(lang: ViewController1.language)
        lblInstruction.text = "INSTRUCTION".localized(lang: ViewController1.language)
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
