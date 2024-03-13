//
//  NetworkHelper.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.
//

import Foundation
import Reachability

class NetworkHelper {
    
    static let shared = NetworkHelper()
    private let reachability = try? Reachability()
    
    var isConnected: Bool = false
    
    private init() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do {
            try reachability?.startNotifier()
            chechNotification()
        } catch {
            print("Could not start reachability notifier")
        }
    }
    
    @objc func reachabilityChanged(note: Notification) {

      let reachability = note.object as! Reachability
        chechNotification()
    }

    private func chechNotification() {
        
        guard let reachability = reachability else {
            print("chechNotification can not finished")
            return
        }
        switch reachability.connection {
        case .wifi, .cellular:
            isConnected = true
        case .unavailable, .none:
          isConnected = false
        }
    }
}
