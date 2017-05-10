//
//  CHKMyViewController.swift
//  Drawer-Swift
//
//  Created by IOSDEV on 16/8/16.
//  Copyright © 2016年 COOL KAI. All rights reserved.
//

import UIKit

class CHKMyViewController: CHKRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackGroundImage()
        // Do any additional setup after loading the view.
    }

    //背景图
    func addBackGroundImage() {
        let imageView = UIImageView(frame: CGRectMake(0, 0, view.width, screen_height))
        imageView.image = UIImage(named: "left_bg")
        view.addSubview(imageView)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
