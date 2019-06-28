
//
//  MainViewController.swift
//  新浪微博
//
//  Created by qianpanpan on 2019/6/27.
//  Copyright © 2019 qianpanpan. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    

    private lazy var composeBtn : UIButton = UIButton(imageName: "tabbar_compose_icon_add", bgImageName: "tabbar_compose_button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarItems()
        setupComposeBtn()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        setupTabbarItemsMiddle()
    }
}


//MARK:- 设置UI界面
extension MainViewController{
    
   
    
    private func setupComposeBtn(){
        tabBar.addSubview(composeBtn)
        composeBtn.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.size.height * 0.5)
        composeBtn.addTarget(self, action: #selector(composeBtnClick), for: .touchUpInside)
    }
    
    private func addChildVC(childVcName:String,title:String,imageName:String){
        
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else{
            print("没有获取到命名空间")
            return
        }
        guard let childVCClass = NSClassFromString(nameSpace+"."+childVcName) else {
            print("没有获取到字符串对应的Class")
            return
        }
        guard let childType = childVCClass as? UIViewController.Type else{
            print("没有获取对应控制器的类型")
            return;
        }
        
        let childVc = childType.init()
        
        childVc.title = title
        childVc.tabBarItem.image = UIImage(named: imageName)
        childVc.tabBarItem.selectedImage = UIImage(named: imageName+"_highlighted")
        let childNav = UINavigationController(rootViewController: childVc)
        addChild(childNav)
    }
    
    private func setupTabbarItems(){
        addChildVC(childVcName: "HomeViewController", title: "首页", imageName: "tabbar_home")
        addChildVC(childVcName: "MessageViewController", title: "消息", imageName: "tabbar_message_center")
        let childVc = UIViewController()
        childVc.view.backgroundColor = UIColor.yellow
        addChild(childVc)
        addChildVC(childVcName: "DiscoverViewController", title: "发现", imageName: "tabbar_discover")
        addChildVC(childVcName: "ProfileViewController", title: "我", imageName: "tabbar_profile")
    }
    
    
    func setupTabbarItemsMiddle(){
        for i in 0 ..< tabBar.items!.count {
            let item = tabBar.items![i]
            if i == 2{
                item.isEnabled = false
            }
        }
    }
}
//MARK:- 事件监听
extension MainViewController{
    @objc private func composeBtnClick(){
        print("aaa")
    }
}

