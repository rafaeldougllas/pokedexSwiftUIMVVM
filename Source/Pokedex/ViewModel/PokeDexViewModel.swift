//
//  PokeDexViewModel.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 03/08/23.
//

import SwiftUI

class PokeDexViewModel: ObservableObject {
    @Published var pokemons: [PokemonIndex] = [PokemonIndex]()
}

extension PokeDexViewModel {
    func getPokemonList() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=151&offset=0") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            let pokemonList = try? JSONDecoder().decode(PokemonList.self, from: data)
            DispatchQueue.main.async {
                if let pokemonsIndex = pokemonList?.results {
                    self.pokemons = pokemonsIndex
                    print("Era pra ter atualizado")
                    print(self.pokemons)
                }
            }
        }.resume()
    }
}
