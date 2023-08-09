//
//  PokemonDetailsViewModel.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 03/08/23.
//

import SwiftUI

class PokemonDetailsViewModel: ObservableObject {
    var pokemonIndex: PokemonIndex
    @Published var pokemon: Pokemon?
    
    init(pokemonIndex: PokemonIndex) {
        self.pokemonIndex = pokemonIndex
    }
}
extension PokemonDetailsViewModel {
    func getPokemon() {
        guard let url = URL(string: pokemonIndex.url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data, let pokemon = try? JSONDecoder().decode(PokemonDetails.self, from: data) {
                let newPokemon = Pokemon(name: pokemon.name ?? "Who is this pokemon?",
                                         id: pokemon.id ?? 0,
                                         height: pokemon.height ?? 0,
                                         weight: pokemon.weight ?? 0,
                                         imageUrl: pokemon.sprites?.front_default ?? "",
                                         types: pokemon.types?.compactMap { PokemonTypesModel(rawValue: $0.type?.name ?? "unknown") } ?? [],
                                         stats: pokemon.stats?.compactMap { PokemonStat(name: $0.stat?.name ?? "",
                                                                                        value: $0.base_stat ?? 0) } ?? [])
                DispatchQueue.main.async {
                    self.pokemon = newPokemon
                }
            }
        }.resume()
    }
    
    func formatNumber(_ number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = 3
        return numberFormatter.string(from: NSNumber(value: number)) ?? ""
    }
    
    func getHexColor(hex: String) -> Color {
       if let hexNumber = UInt32(hex, radix: 16) {
          let red = Double((hexNumber & 0xFF0000) >> 16) / 255.0
          let green = Double((hexNumber & 0x00FF00) >> 8) / 255.0
          let blue = Double(hexNumber & 0x0000FF) / 255.0
          return Color(red: red, green: green, blue: blue, opacity: 1)
       }
       return Color(red: 0, green: 0, blue: 0, opacity: 1)
    }
}
