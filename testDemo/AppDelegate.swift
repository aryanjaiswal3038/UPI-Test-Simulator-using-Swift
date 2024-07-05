//
//  AppDelegate.swift
//  testDemo
//
//  Created by Rishabh Jaiswal on 14/12/23.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if let scheme = url.scheme,
           let view = url.host {
            
            var parameters: [String: String] = [:]
            URLComponents(url: url, resolvingAgainstBaseURL: false)?.queryItems?.forEach {
                parameters[$0.name] = $0.value
            }
            let amount = parameters["am"] ?? ""
            let txnId = parameters["tr"] ?? ""
            // self.value1 = value ?? ""
//            for vc in (
//                window?.rootViewController as? UINavigationController
//            )?.viewControllers ?? [] {
//                if let vc = vc as? ViewController {
//                    vc.load(data: value, txnID: parameters["tr"] ?? "")
//                    window?.rootViewController = UINavigationController(rootViewController: vc)
//                    return true
//                }
//            }
            
            DispatchQueue.main.async{
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "PaymentDetails"), object: nil, userInfo: ["amount": "\(amount)", "txnId" : "\(txnId)"])
                print("Notification Posted")
            }
        }
        return true
    }
    
}

