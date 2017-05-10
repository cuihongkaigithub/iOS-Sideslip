//
//  CHKHomeViewController.swift
//  Drawer-Swift
//
//  Created by IOSDEV on 16/8/16.
//  Copyright © 2016年 COOL KAI. All rights reserved.
//

import UIKit

class CHKHomeViewController: CHKRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(btn)
        // Do any additional setup after loading the view.
    }
    
    private lazy var btn: UIButton = {
        let btn = UIButton(frame: CGRectMake(100,100,150,100))
        btn.setTitle("进入下一级界面", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: "buutonAction", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    
    func buutonAction() {
        hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(UIViewController(), animated: true)
        hidesBottomBarWhenPushed = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
