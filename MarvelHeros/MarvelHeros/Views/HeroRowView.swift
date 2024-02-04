//
//  HeroRowView.swift
//  MarvelHeros
//

import SwiftUI

/**
 `HeroRowView` is a view that displays information about a superhero in a horizontal row.
 
 ## Example Usage:
 ```swift
 let hero = Hero(name: "Spider-Man", realName: "Peter Parker", imageUrl: "https://example.com/spiderman.jpg")
 HeroRowView(hero: hero)
*/
struct HeroRowView: View {
    var hero: Hero

    var body: some View {
        HStack {
            HeroImage(url: hero.imageUrl)
                .frame(width: 150, height: 150)
            
            VStack(alignment: .leading) {
                Text(hero.name ?? "")
                    .font(.headline)

                Text(hero.realName ?? "")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    HeroRowView(hero: Hero(name: "Spiderman", realName: "Peter Parker", team: "Avengers", firstAppearance: "1962", createdBy: "Stan Lee", publisher: "Marvel Comics", imageUrl: "https://www.simplifiedcoding.net/demos/marvel/thor.jpg", bio: "Big bio"))
}
