//
//  AppDelegate.swift
//  Notes
//
//  Created by Alican Aycil on 18.12.2020.
//

import UIKit
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        configureRealm()

        let rootViewController = NavigationController(
            rootViewController: NotesViewController.builder()
        )
        let frame = UIScreen.main.bounds
        let window = UIWindow(frame: frame)
        
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
    
    private func configureRealm() {
        do {
            try FileManager.default.removeItem(at: Realm.Configuration.defaultConfiguration.fileURL!)
        } catch {
            // Log error
        }
    }
    
}

