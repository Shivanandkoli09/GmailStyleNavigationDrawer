//
//  MatchesViewModel.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//

import Foundation
import Combine

class MatchesViewModel: ObservableObject {
    @Published var venues: [Venue] = []
    
    func fetchMatches() async {
        guard let url = URL(string: "https://api.foursquare.com/v2/venues/search?ll=40.7484,-73.9857&oauth_token=NPKYZ3WZ1VYMNAZ2FLX1WLECAWSMUVOQZOIDBN53F3LVZBPQ&v=20180616") else { return }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(VenueResponse.self, from: data)
            
            DispatchQueue.main.async {
                self.venues = decoded.response.venues
            }
        } catch {
            print("Error: \(error)")
        }
    }
    
}
