//
//  VisitorView.swift
//  新浪微博
//
//  Created by qianpanpan on 2019/6/28.
//  Copyright © 2019 qianpanpan. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var iocnView: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    
    
    class func visitorView() -> VisitorView{
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)?.first as! VisitorView
    }
    
    func setupVisitorViewInfo(iconName:String,title:String){
        iocnView.image = UIImage(named: iconName)
        tipLabel.text = title
        rotationView.isHidden = true
    }
    func addRotationAnim(){
        
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnim.fromValue = 0
        rotationAnim.toValue = Double.pi*2
        rotationAnim.repeatCount = MAXFLOAT
        rotationAnim.duration = 6
        rotationAnim.isRemovedOnCompletion = false
        rotationView.layer.add(rotationAnim, forKey: nil)
    }
    

}
