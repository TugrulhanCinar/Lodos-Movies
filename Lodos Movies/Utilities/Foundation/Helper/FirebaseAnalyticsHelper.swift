//
//  FirebaseAnalyticsHelper.swift
//  Lodos Movies
//
//  Created by Tuğrul on 15.03.2024.
//

import FirebaseAnalytics

class FirebaseAnalyticsHelper {
    
    static let shared = FirebaseAnalyticsHelper()
    private init() { }
    
    func sendMovieDetailAnalyticData(movieDetailID id: String) {
        
        Analytics.logEvent("movie_detail", parameters: [
            "itemID": id as NSObject,
            "time": Date().currentTimestampSTR as NSObject
        ])
        
    }
}
