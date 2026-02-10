//
//  APIServiceProtocol.swift
//  iOSAssignment-Robustrade-Kulu-SwiftUI
//
//  Created by Himanshu Patwardhan on 10/02/26.
//

import Foundation

protocol APIServiceProtocol {
    func fetchProducts(page: Int, limit: Int, category: String) async throws -> APIResponse
}
