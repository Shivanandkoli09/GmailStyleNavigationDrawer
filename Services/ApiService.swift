//
//  ApiService.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//

import Foundation
import Combine

class ApiService: ApiserviceProtocol {
    
    func fetchData<T>(_ endpoint: EndPoint) async throws -> T where T : Decodable {
        guard let url = endpoint.url else {
            throw NetworkError.InvalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        guard !data.isEmpty else {
            throw NetworkError.noDataAvailable
        }
        
        return try JSONDecoder().decode(T.self, from: data)
        
    }
    
}
