//
//  AppDelegate.swift
//  TheBookList
//
//  Created by Daniel Colnaghi on 01/04/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let appWindow = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController()
        navController.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir", size: 18) ?? UIFont()]
        
        self.appCoordinator = AppCoordinator(navigationController: navController)
        guard let appCoordinator = self.appCoordinator else { return false }
        appCoordinator.start()

        appWindow.rootViewController =  navController
        appWindow.makeKeyAndVisible()

        window = appWindow
        
        return true
    }
}
