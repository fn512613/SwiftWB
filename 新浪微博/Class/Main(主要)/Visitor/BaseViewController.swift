//
//  BaseViewController.swift
//  新浪微博
//
//  Created by qianpanpan on 2019/6/28.
//  Copyright © 2019 qianpanpan. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {
    
    var isLogin : Bool = false
    lazy var visitorView : VisitorView = VisitorView.visitorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        isLogin ? super.loadView() : setupVistorView()
    }

    
}

extension BaseViewController{
    private func setupVistorView(){
        
        view = visitorView
    }
}
