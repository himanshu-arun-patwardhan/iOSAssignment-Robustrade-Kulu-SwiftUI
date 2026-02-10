//
//  ProductListView.swift
//  iOSAssignment-Robustrade-Kulu-SwiftUI
//
//  Created by Himanshu Patwardhan on 10/02/26.
//

import SwiftUI

struct ProductListView: View {
    @StateObject var viewModel: ProductListViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                List {
                    ForEach(viewModel.products, id: \.id) { productItem in
                        
                        HStack {
                            showImage(imageUrl: productItem.image)
                            VStack(alignment: .leading) {
                                Text(productItem.title)
                                Text(productItem.description)
                                Text(productItem.category)
                                Text("\(productItem.price)")
                            }
                        }
                        .onAppear {
                            if productItem.id == viewModel.products.last?.id {
                                Task {
                                    await viewModel.loadData()
                                }
                            }
                        }
                        
                    }
                }
            }
        }
        .navigationTitle("Products")
        .task {
            await viewModel.loadInitial()
        }
    }
    
    private  func showImage(imageUrl: String) -> some View {
        AsyncImage(url: URL.init(string: imageUrl)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped()
                .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .circular))
        } placeholder: {
            ProgressView()
                .frame(width: 100, height: 100)
        }
        
    }
}
