//
//  PokemonDetailsView.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 02/08/23.
//

import SwiftUI

struct PokemonDetailsView: View {
    @ObservedObject var viewModel: PokemonDetailsViewModel
    
    var body: some View {
        VStack(spacing: 24) {
            if let pokemon = viewModel.pokemon {
                customHeader(pokemon)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        name(pokemon)
                        
                        typesTable(pokemon)
                        
                        HStack {
                            Spacer()
                            textColumn(pokemon,
                                       title: "Weight",
                                       description: pokemon.weight,
                                       suffix: "kg")
                            Spacer()
                            textColumn(pokemon,
                                       title: "Height",
                                       description: pokemon.height,
                                       suffix: "m")
                            Spacer()
                        }
                        
                        detailsTable(pokemon)
                    }
                    .padding(.horizontal, 64)
                }
            } else {
                ProgressView()
            }
        }
        .onAppear { viewModel.getPokemon() }
    }
}

extension PokemonDetailsView {
    func image(_ pokemon: Pokemon) -> some View {
        AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
        } placeholder: {
            ProgressView()
        }
    }
    
    func customHeader(_ pokemon: Pokemon) -> some View {
        viewModel.getHexColor(hex: pokemon.types.first!.color)
            .cornerRadius(50)
            .edgesIgnoringSafeArea(.top)
            .frame(height: 300)
            .overlay { // oposite to backgroung, in front of view
                image(pokemon)
            }
    }
    
    func name(_ pokemon: Pokemon) -> some View {
        HStack {
            Text(pokemon.name.capitalized)
                .fontWeight(.heavy)
            Text("#\(viewModel.formatNumber(pokemon.id))")
                .fontWeight(.bold)
                .foregroundColor(.gray.opacity(0.5))
        }
        .font(.title)
    }
    
    func typesTable(_ pokemon: Pokemon) -> some View {
        HStack(spacing: 24) {
            ForEach(pokemon.types, id: \.self) { type in
                Text(type.rawValue)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(
                        Capsule()
                            .fill(viewModel.getHexColor(hex: type.color))
                    )
            }
        }
    }
    
    func textColumn(_ pokemon: Pokemon,
                    title: String,
                    description: Double,
                    suffix: String) -> some View {
        VStack {
            Text(title)
                .font(.title3)
            Text("\(String(format: "%.1f", description/10))\(suffix)")
                .font(.title)
                .fontWeight(.bold)
        }
    }
    
    func detailsTable(_ pokemon: Pokemon) -> some View {
        VStack(spacing: 24) {
            Text("Details")
                .font(.title)
                .fontWeight(.heavy)
            ForEach(pokemon.stats) { stat in
                HStack {
                    Text(stat.name.capitalized)
                    Spacer()
                    Text("\(stat.value)")
                        .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    PokemonDetailsView(viewModel: PokemonDetailsViewModel(pokemonIndex: .init(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")))
}
