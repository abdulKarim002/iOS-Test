//
//  Home.swift
//  goeuro_test
//
//  Created by abdul karim on 27/08/16.
//  Copyright © 2016 dh-labs. All rights reserved.
//

import UIKit

class Home: UIViewController,CarbonTabSwipeNavigationDelegate {

    @IBOutlet weak var scrollMenu: UIToolbar!
    @IBOutlet weak var targetView: UIView!
    
    var carbonTabSwipeNavigation: CarbonTabSwipeNavigation = CarbonTabSwipeNavigation()
    
    override func viewDidLoad() {
       let items = ["Flights", "Trains", "Buses"]

        carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items as [AnyObject], toolBar: self.scrollMenu, delegate: self)
        carbonTabSwipeNavigation.insertIntoRootViewController(self, andTargetView: self.targetView)
        
        self.style()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    func style() {
        let customColor: UIColor = UIColor(red: 122 / 255, green: 30 / 255, blue: 161 / 255, alpha: 1.0)
        
        //Getting screen width to divide page menu proprotionally
        let screenSize = UIScreen.mainScreen().bounds.size
        let width = screenSize.width
        
        carbonTabSwipeNavigation.toolbar.translucent = false
        carbonTabSwipeNavigation.toolbar.barTintColor = customColor
        carbonTabSwipeNavigation.toolbar.barStyle = .Black
        carbonTabSwipeNavigation.setTabBarHeight(50)
        carbonTabSwipeNavigation.setIndicatorColor(UIColor.whiteColor())
        carbonTabSwipeNavigation.setSelectedColor(UIColor.whiteColor())
        //carbonTabSwipeNavigation.setIndicatorHeight(0)
        carbonTabSwipeNavigation.setTabExtraWidth(10)
        carbonTabSwipeNavigation.carbonSegmentedControl!.setWidth(width/3, forSegmentAtIndex: 0)
        carbonTabSwipeNavigation.carbonSegmentedControl!.setWidth(width/3, forSegmentAtIndex: 1)
        carbonTabSwipeNavigation.carbonSegmentedControl!.setWidth(width/3, forSegmentAtIndex: 2)
        
        
        
        carbonTabSwipeNavigation.setNormalColor(UIColor.lightGrayColor().colorWithAlphaComponent(0.6))
        carbonTabSwipeNavigation.setSelectedColor(UIColor.whiteColor(), font: UIFont.boldSystemFontOfSize(14))
        
    }
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAtIndex index: UInt) -> UIViewController {
        
        switch index {
        case 0:
            return self.storyboard!.instantiateViewControllerWithIdentifier("Flight") as! Flight
        case 1:
            return self.storyboard!.instantiateViewControllerWithIdentifier("Train") as! Train
        case 2:
            return self.storyboard!.instantiateViewControllerWithIdentifier("Buses") as! Buses
            
        default :
            return self.storyboard!.instantiateViewControllerWithIdentifier("Flight") as! Flight
            
        }
        
    }
    
    func carbonTabSwipeNavigation(carbonTabSwipeNavigation: CarbonTabSwipeNavigation, didMoveAtIndex index: UInt) {
        NSLog("Did move at index: %ld", index)
    }
}
