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
        
        Analytics.logEvent(FirebaseAnalyticsHelperKeys.movieDetail, parameters: [
            FirebaseAnalyticsHelperKeys.itemID: id as NSObject,
            FirebaseAnalyticsHelperKeys.time: Date().currentTimestampSTR as NSObject
        ])
    }
    
}

class FirebaseAnalyticsHelperKeys {
    
    // MARK: EVENTSID
    static var movieDetail = "movie_detail"
    
    // MARK: EVENTKEYS
    
    static var itemID = "itemID"
    static var time = "time"
}
