//
//  BaseViewController.swift
//  新浪微博
//
//  Created by qianpanpan on 2019/6/28.
//  Copyright © 2019 qianpanpan. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {
    
    var isLogin : Bool = true
    lazy var visitorView : VisitorView = VisitorView.visitorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItems()
    }
    
    override func loadView() {
        isLogin ? super.loadView() : setupVistorView()
    }

    
}
//MARK:- 设置UI界面
extension BaseViewController{
    private func setupVistorView(){
        view = visitorView
        visitorView.registerBtn.addTarget(self, action: #selector(registerBtnClick), for: .touchUpInside)
        visitorView.loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
    }
    
    private func setupNavigationItems(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(registerBtnClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(loginBtnClick))
    }
    
   
    
    
}
//MARK:- 事件监听
extension BaseViewController{
    @objc private func registerBtnClick(){
        print("zhuce")
    }
    
    @objc private func loginBtnClick(){
        print("login")
    }
}
