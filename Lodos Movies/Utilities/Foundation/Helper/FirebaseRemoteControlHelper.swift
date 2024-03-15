//
//  FirebaseRemoteControlHelper.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.
//

import Foundation
import Firebase

class FirebaseRemoteControlHelper {
    
    static let shared = FirebaseRemoteControlHelper()
    private let defaults: [String: NSObject] = [
        "welcome_text": false as NSObject
    ]
    private let remoteConfig: RemoteConfig
    private let settings: RemoteConfigSettings
    
    var welcomeText: String?
    
    private init() {
        
        self.remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.setDefaults(defaults)
        self.settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        
        remoteConfig.configSettings = settings
        
        
    }
    
    func fetchValues(completionHandler: @escaping (String?) -> Void) {
        
        remoteConfig.fetch(withExpirationDuration: 0) { status, error in
            if status == .success, error == nil {
                self.remoteConfig.activate { _, error in
                    guard error == nil else {
                        print("Remote config data can not fetch")
                        completionHandler(nil)
                        return
                    }
                    
                    self.welcomeText = self.remoteConfig.configValue(forKey: FirebaseRemoteKeys.welcomeText.rawValue).stringValue
                    
                    completionHandler(self.welcomeText)
                }
            } else {
                print("something went wrong")
                completionHandler(nil)

            }
        }
    }
}
