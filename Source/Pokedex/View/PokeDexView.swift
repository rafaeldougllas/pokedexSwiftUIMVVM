//
//  PokeDexView.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 25/07/23.
//

import SwiftUI

struct PokeDexView: View {
    @StateObject var viewModel = PokeDexViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.pokemons, id: \.id) { pokemon in
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
                    Text(pokemon.name?.capitalized ?? "Unknown")
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
