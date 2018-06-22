//
//  MainViewController.swift
//
//  Created by Renzo Alvarado on 22/06/18.
//  Copyright © 2018 Synopsis. All rights reserved.
//
import UIKit
import CoreData
import Foundation


import AWSCore
import AWSPinpoint

import AWSAuthCore
import AWSAuthUI

import SideMenu

class MainViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    // NSFetchedResultsController as an instance variable of table view controller
    // to manage the results of a Core Data fetch request and display data to the user.
    var _fetchedResultsController: NSFetchedResultsController<Note>? = nil
    var managedObjectContext: NSManagedObjectContext? = nil
    
    var notes: [NSManagedObject] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Instantiate sign-in UI from the SDK library
       // if !AWSSignInManager.sharedInstance().isLoggedIn {
            AWSAuthUIViewController
                .presentViewController(with: self.navigationController!,
                                       configuration: nil,
                                       completionHandler: { (provider: AWSSignInProvider, error: Error?) in
                                        if error != nil {
                                            print("Error occurred: \(String(describing: error))")
                                        } else {
                                            // Sign in successful.
                                        }
                })
       // }
        
        
        
        setupSideMenu()
        setDefaults()
    }
    
    fileprivate func setupSideMenu() {
        // Define the menus
        SideMenuManager.default.menuLeftNavigationController = storyboard!.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? UISideMenuNavigationController
       // SideMenuManager.default.menuRightNavigationController = storyboard!.instantiateViewController(withIdentifier: "RightMenuNavigationController") as? UISideMenuNavigationController
        
        // Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the View Controller it displays!
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
       // SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view )
        
        // Set up a cool background image for demo purposes
       // SideMenuManager.default.menuAnimationBackgroundColor = UIColor(patternImage: UIImage(named: "background")!)
    }
    
    fileprivate func setDefaults() {
        let modes:[SideMenuManager.MenuPresentMode] = [.menuSlideIn, .viewSlideOut, .menuDissolveIn]
    
        SideMenuManager.default.menuPresentMode = modes[1]
        let styles:[UIBlurEffectStyle] = [.dark, .light, .extraLight]
        SideMenuManager.default.menuBlurEffectStyle = styles[2]
      
        SideMenuManager.default.menuWidth = view.frame.width * CGFloat(10.0)
       
        //SideMenuManager.default.menuAnimationFadeStrength = CGFloat(slider.value)
        //SideMenuManager.default.menuShadowOpacity = slider.value
        //SideMenuManager.default.menuAnimationTransformScaleFactor = CGFloat(slider.value)
        //SideMenuManager.default.menuWidth = view.frame.width * CGFloat(slider.value)
        
        SideMenuManager.default.menuFadeStatusBar = false;
        SideMenuManager.default.menuWidth = 300
        
    }
    
}

extension MainViewController: UISideMenuNavigationControllerDelegate {
    
    func sideMenuWillAppear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Appearing! (animated: \(animated))")
    }
    
    func sideMenuDidAppear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Appeared! (animated: \(animated))")
    }
    
    func sideMenuWillDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappearing! (animated: \(animated))")
    }
    
    func sideMenuDidDisappear(menu: UISideMenuNavigationController, animated: Bool) {
        print("SideMenu Disappeared! (animated: \(animated))")
    }
    
}
