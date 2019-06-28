
//
//  HomeViewController.swift
//  新浪微博
//
//  Created by qianpanpan on 2019/6/27.
//  Copyright © 2019 qianpanpan. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    private lazy var titleBtn = TitleButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        visitorView.addRotationAnim()
        if !isLogin{
            return
        }
        setupNavigationBar()
        
    }
}



//MARK:- 设置UI界面
extension HomeViewController{
    private func setupNavigationBar(){
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
      
        titleBtn.setTitle("吕阿蒙", for: .normal)
        navigationItem.titleView = titleBtn
        titleBtn.addTarget(self, action: #selector(titleBtnClick), for: .touchUpInside)
    }
}

extension HomeViewController{
    @objc private func titleBtnClick(){
        titleBtn.isSelected = !titleBtn.isSelected
        let vc = PopoverViewController()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self

        present(vc, animated: true, completion: nil)
    }
}


extension HomeViewController:UIViewControllerTransitioningDelegate{
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        return QPPPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
}
