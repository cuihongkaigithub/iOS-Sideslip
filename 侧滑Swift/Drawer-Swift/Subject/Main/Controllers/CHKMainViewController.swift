//
//  CHKMainViewController.swift
//  侧滑
//
//  Created by IOSDEV on 16/8/16.
//  Copyright © 2016年 COOL KAI. All rights reserved.
//

import UIKit

let screen_width: CGFloat = UIScreen.mainScreen().bounds.size.width
let screen_height: CGFloat = UIScreen.mainScreen().bounds.size.height

class CHKMainViewController: CHKRootViewController {
    
    var _mainVC: UIViewController?
    var _leftVC: UIViewController?
    var _point = CGPointZero
    var _changePoint = CGPointZero
    var _openLeftVC: Bool = false
    var _pan: UIPanGestureRecognizer?
    var _tap: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _pan = UIPanGestureRecognizer(target: self, action: "pan:")
        view.addGestureRecognizer(_pan!)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "getPushNotificationCenter", name: "push", object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "getPopNotificationCenter", name: "pop", object: nil);
    }
    
    //MARK: -------------初始化--------------
    //初始化主界面
    func create(leftVC: UIViewController, tabVC: UIViewController) ->CHKMainViewController {
        _mainVC = tabVC
        _leftVC = leftVC
        _leftVC?.view.frame = CGRectMake(-0.4 * screen_width, 0, 0.8 * screen_width, screen_height)
        _leftVC?.view.hidden = true
        view.addSubview(_leftVC!.view)
        _mainVC?.view.frame = view.bounds
        view.addSubview(_mainVC!.view)
        return self
    }
    
    //MARK: ---------------懒加载-------------
    private lazy var _rightView:UIView = {
        let rightView = UIView(frame: CGRectMake(0.8*screen_width, 0, 0.2*screen_width,screen_height))
        self._tap = UITapGestureRecognizer(target: self, action: "tap")
        rightView.addGestureRecognizer(self._tap!)
        return rightView
    }()
    //MARK: --------------视图操作-------------
    //展示左视图
    func showLeftView() {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self._leftVC?.view.x = 0
            self._leftVC?.view.width = 0.8 * screen_width
            self._mainVC?.view.x = 0.8 * screen_width
            }) { (_) -> Void in
                self.view.addSubview(self._rightView)
        }
    }
    //隐藏左视图
    func hiddenLeftView() {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self._leftVC?.view.width = screen_width
            self._leftVC?.view.x = -0.4 * screen_width
            self._mainVC?.view.x = 0
            }) { (_) -> Void in
                self._leftVC?.view.hidden = true
                self._rightView.removeFromSuperview()
        }
    }
    
    //MARK: ---------- 手势 -----------
    //点击取消侧滑效果
    func tap() {
        _openLeftVC = false
        hiddenLeftView()
    }
    //拖动手势
    func pan(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .Began:
            _leftVC?.view.hidden = false
            _point = sender.locationInView(self.view)
        case .Changed:
            _changePoint = sender.locationInView(self.view)
            var width = _changePoint.x - _point.x
            if _openLeftVC == false //左视图当前处于隐藏状态
            {
                if width <= 0 {
                    return
                }
                //最大拖动距离为左视图的宽度
                if width >= 0.8 * screen_width {
                    width = 0.8 * screen_width
                }
                _mainVC?.view.x = width
                _leftVC?.view.centerX = width/2
            } else {
                width = _point.x - _changePoint.x
                if width <= 0 {
                    return
                }
                if width >= 0.8 * screen_width {
                    width = 0.8 * screen_width
                }
                _mainVC?.view.x = 0.8 * screen_width - width
                _leftVC?.view.centerX = 0.4 * screen_width - width/2
            }
        case .Ended:
            sender.setTranslation(CGPointZero, inView: view)
            if _mainVC?.view.x < 0.5 * screen_width {
                _openLeftVC = false
                hiddenLeftView()
            } else {
                _openLeftVC = true
                showLeftView()
            }
        default:
            break
        }
    }
    //MARK: ---------------通知处理方法------------
    func getPushNotificationCenter(){
        view.removeGestureRecognizer(_pan!);
    }
    func getPopNotificationCenter(){
        view.addGestureRecognizer(_pan!);
    }
}
