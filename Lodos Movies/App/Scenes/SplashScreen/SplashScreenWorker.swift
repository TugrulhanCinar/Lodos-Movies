//
//  SplashScreenWorker.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.

import UIKit

class SplashScreenWorker {

    func checkConnection() -> Bool {
        
        return NetworkHelper.shared.isConnected
    }
    
    func fetchWelcomeText(completionHandler: @escaping (String?) -> Void) {
        
        if let welcomeText = FirebaseRemoteControlHelper.shared.welcomeText {
            completionHandler(welcomeText)
        } else {
            FirebaseRemoteControlHelper.shared.fetchValues { txt in
                completionHandler(txt)
            }
        }
    }
}
