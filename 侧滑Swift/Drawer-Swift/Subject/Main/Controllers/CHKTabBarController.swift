//
//  CHKTabBarController.swift
//  Drawer-Swift
//
//  Created by IOSDEV on 16/8/16.
//  Copyright © 2016年 COOL KAI. All rights reserved.
//

import UIKit

class CHKTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addItem(title: String, imageName: String, hightName: String, className: String) {
        if let appName: String = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleExecutable") as! String? {
            let classStringName = "\(appName).\(className)"
            let classType = NSClassFromString(classStringName) as? CHKRootViewController.Type
            if let type = classType {
                let newVC = type.init()
                newVC.title = title
                newVC.tabBarItem.image = UIImage(named: imageName)
                newVC.tabBarItem.selectedImage = UIImage(named: hightName)
                addChildViewController(CHKNavigationController(rootViewController:newVC))
            }
        }
    }
    func addItems(titles: Array<String>, imgNames: Array<String>, hightNames: Array<String>, classNames:Array<String>) {
        for i in 0..<titles.count {
            addItem(titles[i], imageName: imgNames[i], hightName: hightNames[i], className: classNames[i])
        }
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
