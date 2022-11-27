//
//  EmptySearchView.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import SwiftUI

struct EmptySearchView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            Text("Search for Character")
                .font(.largeTitle)
        }
        .foregroundColor(.white)
    }
}

struct EmptySearchView_Previews: PreviewProvider {
    static var previews: some View {
        EmptySearchView()
            .preferredColorScheme(.dark)
    }
}
