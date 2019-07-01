//
//  UIBarButtonItem-Extension.swift
//  新浪微博
//
//  Created by qianpanpan on 2019/6/28.
//  Copyright © 2019 qianpanpan. All rights reserved.
//

import UIKit
extension UIBarButtonItem{
    convenience init(imageName:String){
        self.init()
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName+"_highlighted"), for: .highlighted)
        btn.sizeToFit()
        self.customView = btn
    }
}


