//
//  ProductListViewModel.swift
//  iOSAssignment-Robustrade-Kulu-SwiftUI
//
//  Created by Himanshu Patwardhan on 10/02/26.
//

import Foundation
import Combine

@MainActor
class ProductListViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var products: [Product] = []
    
    private var page = 0
    private var total = 0
    
    private let limit = 10
    private let category = "electronics"
    
    var hasMorePges: Bool {
        products.count < total
    }
    
    
    let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    
    private func reset() {
        page =  0
        total = 0
        products = []
    }
    
    func loadInitial() async {
        reset()
        await loadData()
    }
    
    func loadData() async {
        isLoading = true
        errorMessage  = nil
        
        do {
            let response = try await apiService.fetchProducts(page: page,
                                                              limit: limit,
                                                              category: category)
            products.append(contentsOf: response.data)
            total = response.pagination.total
            page = page + 1
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
