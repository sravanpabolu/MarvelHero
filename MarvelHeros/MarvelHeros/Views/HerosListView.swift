//
//  HerosListView.swift
//  MarvelHeros
//

import SwiftUI

/**
 `HerosListView` is a view that displays a list of superheroes.
 
 ## Example Usage:
 ```swift
 let heroesListView = HerosListView()
*/
struct HerosListView: View {
    @ObservedObject private var viewModel = HerosViewModel()
    
    var body: some View {
        NavigationView {
            contentView
                .navigationTitle(Constants.listViewTitle)
        }
        .onAppear {
            viewModel.fetchHeros()
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        if viewModel.isLoading {
            ProgressView()
                .progressViewStyle(.circular)
                .foregroundStyle(.black)
        } else if viewModel.hasError {
            Text(viewModel.errorMessage)
        } else {
            List(viewModel.heroes, id: \.name) { hero in
                NavigationLink(destination: HeroDetailView(hero: hero)) {
                    HeroRowView(hero: hero)
                }
            }
        }
    }
}

#Preview {
    HerosListView()
}
