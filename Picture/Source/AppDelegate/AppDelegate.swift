//
//  AppDelegate.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/10.
//

import UIKit
import RIBs

@main
class AppDelegate: UIResponder, UIApplicationDelegate  {

    var window: UIWindow?
    
    private var launchRouter : LaunchRouting?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let result = AppRootBuilder(dependency: AppComponent()).build()
        self.launchRouter = result
        //MARK: - Image Setting
        result.launch(from: window)
        
        return true
    }
    
}

