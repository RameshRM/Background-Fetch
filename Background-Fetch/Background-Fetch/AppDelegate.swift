//
//  AppDelegate.swift
//  Background-Fetch
//
//  Created by Mahadevan, Ramesh on 10/29/14.
//  Copyright (c) 2014 GoliaMania. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        UIApplication.sharedApplication().setMinimumBackgroundFetchInterval(2);
        return true
    }

    
    
    func application(application: UIApplication, performFetchWithCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        completionHandler(UIBackgroundFetchResult.NewData)
        refresh();
    }
    
    func refresh() -> Void{
        var mainView: ViewController = window?.rootViewController as ViewController!;
        let formatter = NSDateFormatter()
        formatter.dateStyle = .NoStyle
        formatter.timeStyle = .MediumStyle
        
        let now = formatter.stringFromDate(NSDate())
        
        mainView.onMessageReceived("Hello World !!! \(now)");
    }
        
        

}

