//
//  QPPPresentationController.swift
//  新浪微博
//
//  Created by qianpanpan on 2019/6/28.
//  Copyright © 2019 qianpanpan. All rights reserved.
//

import UIKit

class QPPPresentationController: UIPresentationController {
    
    private lazy var coverView : UIView = UIView()
    
    override func containerViewWillLayoutSubviews() {
        super.containerViewWillLayoutSubviews()
        presentedView?.frame = CGRect(x: 90, y: 55, width: 200, height: 250)
        
        setupCoverView()
    }

}
//MARK:- 设置UI界面相关

extension QPPPresentationController{
    private func setupCoverView(){
        containerView?.insertSubview(coverView, at: 0)
        coverView.backgroundColor = UIColor(white: 0.7, alpha: 0.2)
        coverView.frame = containerView!.bounds
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(coverViewClick))
        coverView.addGestureRecognizer(tapGes)
        
    }
}
//MARK:- 事件监听
extension QPPPresentationController{
    @objc private func coverViewClick(){
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}

