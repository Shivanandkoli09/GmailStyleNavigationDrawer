//
//  NetworkError.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//


import Foundation

enum NetworkError: LocalizedError {
    case noDataAvailable
    case decodingError
    case unknownError
    case InvalidURL
    
    var errorDescription: String? {
        switch self {
        case .noDataAvailable: return "No data available."
        case .decodingError: return "Failed to decode data."
        case .unknownError: return "An unknown error occurred."
        case .InvalidURL: return "Invalid URL"
        }
    }
}


