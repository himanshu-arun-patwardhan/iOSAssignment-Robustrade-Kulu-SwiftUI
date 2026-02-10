//
//  APIService.swift
//  iOSAssignment-Robustrade-Kulu-SwiftUI
//
//  Created by Himanshu Patwardhan on 10/02/26.
//

import Foundation

final class APIService: APIServiceProtocol {
    func fetchProducts(page: Int, limit: Int, category: String) async throws -> APIResponse {
        let baseUrl = ""
        let path = ""
        var components = URLComponents(string: "\(baseUrl)\(path)")
        components?.queryItems = [
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "category", value: "\(category)")
        ]
        let (data, _) = try await URLSession.shared.data(from: (components?.url)!)
        let response = try JSONDecoder().decode(APIResponse.self, from: data)
        return response
    }
}
