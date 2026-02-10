//
//  ProductDetailView.swift
//  iOSAssignment-Robustrade-Kulu-SwiftUI
//
//  Created by Himanshu Patwardhan on 10/02/26.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    var body: some View {
        VStack() {
            AsyncImage(url: URL.init(string: product.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
            } placeholder: {
                ProgressView()
                    .frame(width: 200, height: 200)
            }
            VStack(alignment: .leading) {
                Text(product.title)
                Text(product.description)
                Text(product.category)
                Text(product.price, format: .currency(code: "INR"))
            }
            Spacer()
        }
    }
}
