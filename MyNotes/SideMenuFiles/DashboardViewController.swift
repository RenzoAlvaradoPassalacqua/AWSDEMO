//
//  DashboardViewController.swift
//  MyNotes
//
//  Created by SYNOPSIS on 22/06/18.
//  Copyright © 2018 Hills, Dennis. All rights reserved.
//
import UIKit
import CoreData
import Foundation

import AWSCore
import AWSPinpoint
import UIKit
import AWSAuthCore
import AWSAuthUI
import SideMenu

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        print("DashboardViewController | viewDidLoad");
        let menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as! UISideMenuNavigationController
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        
        
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the view controller it displays!
      //  SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
      //  SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        SideMenuManager.default.menuPresentMode = .viewSlideInOut
        
        
    }
}
