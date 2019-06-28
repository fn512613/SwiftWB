//
//  UIButton-Extension.swift
//  新浪微博
//
//  Created by qianpanpan on 2019/6/28.
//  Copyright © 2019 qianpanpan. All rights reserved.
//


import UIKit

extension UIButton{
    class func createButton(imageName:String,bgImageName:String) -> UIButton{
        
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        btn.setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        return btn
    }
    
    
    //便利构造函数通常用在对系统的类进行构造函数的扩充时使用
    //便利构造函数的特点
    //1.便利构造函数通常都是写在extension里面
    //2.便利构造函数init前面需要加载convenience
    //3.在便利构造函数中需要明确的调用self.init()
    convenience init(imageName:String,bgImageName:String){
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        setBackgroundImage(UIImage(named: bgImageName), for: .normal)
        setBackgroundImage(UIImage(named: bgImageName + "_highlighted"), for: .highlighted)
        sizeToFit()
    }
}
