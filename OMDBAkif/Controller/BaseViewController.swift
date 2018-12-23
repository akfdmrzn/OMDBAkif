//
//  BaseViewController.swift
//  OMDBAkif
//
//  Created by Akif on 24.12.2018.
//  Copyright © 2018 Akif. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class BaseViewController: UIViewController {

    
    
    var blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
    var blurEffectView : UIVisualEffectView?
    var indicator :  NVActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func indicatorShow(status : Bool){
        
        if !status{
            self.blurEffectView?.removeFromSuperview()
            indicator?.stopAnimating()
        }
        else{
            self.blurEffectView =  UIVisualEffectView(effect: self.blurEffect)
            self.blurEffectView?.frame = view.bounds
            self.blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.view.addSubview(blurEffectView!)
            
            let color = UIColor(red: 255/255, green: 185/255, blue: 15/255, alpha: 1.0)
            let frame = CGRect(x: (self.view.frame.width/2)*0.7, y: (self.view.frame.height/2)*0.7, width: self.view.frame.width/3, height: self.view.frame.height/3)
            self.indicator =  NVActivityIndicatorView(frame: frame, type: NVActivityIndicatorType.ballSpinFadeLoader, color: color, padding: NVActivityIndicatorView.DEFAULT_PADDING )
            
            self.view.addSubview(indicator!)
            indicator?.startAnimating()
        }
    }
}
