//
//  HeroImage.swift
//  MarvelHeros
//
//  Created by Nirosha Pabolu on 05/02/24.
//

import SwiftUI

/**
 `HeroImage` is a view that asynchronously loads and displays a superhero image from a given URL. This component will also provide different views on different phases of loading the image from the web
 
 ## Example Usage:
 ```swift
 let heroImageView = HeroImage(url: "https://example.com/thor.jpg")
*/
public struct HeroImage: View {
    let url: String?
    
    public var body: some View {
        AsyncImage(url: URL(string: url ?? "")) { phase in
            switch phase {
            case .empty:
                VStack {
                    Spacer()
                    ProgressView()
                        .progressViewStyle(.circular)
                        .foregroundStyle(.black)
                    Spacer()
                }
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
            @unknown default:
                EmptyView()
            }
        }
        .cornerRadius(10)
    }
}

#Preview {
    HeroImage(url: "https://www.simplifiedcoding.net/demos/marvel/thor.jpg")
}
