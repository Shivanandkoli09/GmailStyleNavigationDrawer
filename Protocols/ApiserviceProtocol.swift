//
//  ApiserviceProtocol.swift
//  NavigationDrwer
//
//  Created by Shivanand Koli on 04/04/26.
//


import Foundation

protocol ApiserviceProtocol {
    func fetchData<T: Decodable> (_ endpoint: EndPoint) async throws -> T
}
