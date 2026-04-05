//
//  EndPoint.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//

import Foundation

enum EndPoint: String {
    case users
    
    var url: URL? {
        switch self {
        case .users:
            return URL(string: "https://api.foursquare.com/v2/venues/search?ll=40.7484,-73.9857&oauth_token=NPKYZ3WZ1VYMNAZ2FLX1WLECAWSMUVOQZOIDBN53F3LVZBPQ&v=20180616")
        }
    }
}
