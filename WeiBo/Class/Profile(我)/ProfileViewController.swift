//
//  ProfileViewController.swift
//  新浪微博
//
//  Created by qianpanpan on 2019/6/27.
//  Copyright © 2019 qianpanpan. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView.setupVisitorViewInfo(iconName: "visitordiscover_image_profile", title: "登录后，你的微博、相册、个人资料会显示在这里，展示给别人")
    }

   
}
