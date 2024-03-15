//
//  SplashScreenModels.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.

enum SplashScreen {

    // MARK: Use cases

    enum Initialize {

        struct Request { }

        struct Response { 
            var isConnection: Bool
        }

        struct ViewModel { 
            var isConnection: Bool
        }
    }

    enum Reload {

        struct Request { }

        struct Response { 
            var welcomeText: String?
        }

        struct ViewModel { 
            var welcomeText: String?
        }
    }

    enum Finalize {

        struct Request { }

        struct Response { }

        struct ViewModel { }
    }
}
