//
//  ProductListViewFactory.swift
//  iOSAssignment-Robustrade-Kulu-SwiftUI
//
//  Created by Himanshu Patwardhan on 10/02/26.
//

class ProductListViewFactory {
    static func build() -> ProductListView {
        let apiService = APIService()
        let viewModel = ProductListViewModel(apiService: apiService)
        return ProductListView(viewModel: viewModel)
    }
}
