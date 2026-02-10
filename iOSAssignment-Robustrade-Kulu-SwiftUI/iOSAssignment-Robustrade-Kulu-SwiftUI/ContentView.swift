//
//  ContentView.swift
//  iOSAssignment-Robustrade-Kulu-SwiftUI
//
//  Created by Himanshu Patwardhan on 10/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ProductListViewFactory.build()
    }
}

#Preview {
    ContentView()
}
