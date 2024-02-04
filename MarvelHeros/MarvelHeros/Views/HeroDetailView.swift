//
//  HeroDetailView.swift
//  MarvelHeros
//

import SwiftUI

/**
 `HeroDetailView` is a view that displays detailed information about a superhero.
 
 ## Example Usage:
 ```swift
 let hero = Hero(name: "Spider-Man", realName: "Peter Parker", imageUrl: "https://example.com/spiderman.jpg")
 let heroDetail = HeroDetailView(hero: hero)
*/
struct HeroDetailView: View {
    var hero: Hero

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                HeroImage(url: hero.imageUrl)
                    .frame(height: 200)
                    .clipped()

                Text("\(Constants.realName) \(hero.realName ?? "")")
                    .font(.headline)

                Text("\(Constants.team) \(hero.team ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("\(Constants.firstAppearance) \(hero.firstAppearance ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("\(Constants.createdBy) \(hero.createdBy ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("\(Constants.publisher) \(hero.publisher ?? "")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("\(Constants.bio) \(hero.bio ?? "")")
                    .font(.body)
            }
            .padding()
        }
        .navigationBarTitle(hero.name ?? "")
    }
}

#Preview {
    HeroDetailView(hero: Hero(name: "Spiderman", realName: "Peter Parker", team: "Avengers", firstAppearance: "1962", createdBy: "Stan Lee", publisher: "Marvel Comics", imageUrl: "", bio: "Big bio"))
}
