//
//  PopoverAnimator.swift
//  新浪微博
//
//  Created by qianpanpan on 2019/7/1.
//  Copyright © 2019 qianpanpan. All rights reserved.
//

import UIKit


class PopoverAnimator: NSObject {
    var isPresented : Bool = false
    var presentFrame : CGRect = CGRect.zero
    
    var callBack : ((_ isPresented : Bool) -> ())?
    
    override init() {
        
    }
    
    
    init(callBack : @escaping (_ isPresented : Bool) -> ()){
        self.callBack = callBack
    }
}

//MARK:- 自定义转场代理方法

extension PopoverAnimator:UIViewControllerTransitioningDelegate{
    
    //改变弹出View的尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentation = QPPPresentationController(presentedViewController: presented, presenting: presenting)
        presentation.presentedFrame = presentFrame
        
        return presentation
    }
    
    //自定义弹出动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = true
        
        callBack!(isPresented)
        return self
    }
    
    //自定义消失的动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresented = false
        callBack!(isPresented)
        return self
    }
    
}

//弹出和消失动画代理的方法
extension PopoverAnimator : UIViewControllerAnimatedTransitioning{
    
    //动画执行的时间
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    
    //获取转场的上下文：可以通过转场上下文获取弹出的View和消失的View
    //   UITransitionContextToViewKey 获取消失的View
    //   UITransitionContextFromViewKey 获取弹出的View
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresented ? animationForPresentedView(using: transitionContext) : animationForDismissedView(using: transitionContext)
    }
    
    private func animationForPresentedView(using transitionContext: UIViewControllerContextTransitioning){
        //1、获取弹出的View
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        //2、将弹出的View添加到containerView中
        transitionContext.containerView.addSubview(presentedView)
        
        //3、执行动画
        presentedView.transform = CGAffineTransform(scaleX: 1.0,y: 0.0)
        presentedView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            presentedView.transform = CGAffineTransform.identity
        }) { (isFinished) in
            //必须告诉转场上下文你已经完成动画
            transitionContext.completeTransition(true)
        }
    }
    
    private func animationForDismissedView(using transitionContext: UIViewControllerContextTransitioning){
        //1、获取消失的View
        let dismissView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        
        //2、执行动画
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            dismissView.transform = CGAffineTransform(scaleX: 1.0, y: 0.0001)
        }) { (isFinished) in
            
            dismissView.removeFromSuperview()
            //必须告诉转场上下文你已经完成动画
            transitionContext.completeTransition(true)
        }
    }
    
}
