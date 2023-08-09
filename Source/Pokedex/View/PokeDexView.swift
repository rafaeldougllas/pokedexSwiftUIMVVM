//
//  PokeDexView.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 25/07/23.
//

import SwiftUI

struct PokeDexView: View {
    @StateObject var viewModel = PokeDexViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search a pokemon", text: $searchText)
                    .disableAutocorrection(true)
                    .padding(16)
                    .padding(.horizontal, 45)
                    .background(Color.orange.opacity(0.3))
                    .cornerRadius(40)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Color(.systemGray))
                                .frame(minWidth: 0,
                                       maxWidth: .infinity,
                                       alignment: .leading)
                                .padding(.horizontal, 20)
                            
                        }
                    )
                
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.pokemons.filter {
                        searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())
                    }, id: \.id) { pokemon in
                        listItem(pokemon)
                    }
                }
            }
            .padding(.horizontal)
            .onAppear {
                viewModel.getPokemonList()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Pokemons List")
    }
}
extension PokeDexView {
    func listItem(_ pokemon: PokemonIndex) -> some View {
        NavigationLink {
            PokemonDetailsView(viewModel: PokemonDetailsViewModel(pokemonIndex: pokemon))
        } label: {
            VStack {
                HStack {
                    Text(pokemon.name.capitalized)
                        .foregroundStyle(.gray)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.black)
                }
                .padding(.vertical)
                
                Divider()
            }
        }
        
    }
}

#Preview {
    PokeDexView()
}
