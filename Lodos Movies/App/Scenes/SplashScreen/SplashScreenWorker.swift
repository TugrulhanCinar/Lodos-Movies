//
//  SplashScreenWorker.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class SplashScreenWorker {

    func checkConnection() -> Bool {
        
        return NetworkHelper.shared.isConnected
    }
    
    func fetchWelcomeText(completionHandler: @escaping (String?) -> Void) {
        
        FirebaseRemoteControlHelper.shared.fetchValues { txt in
            completionHandler(txt)
        }
    }
}
