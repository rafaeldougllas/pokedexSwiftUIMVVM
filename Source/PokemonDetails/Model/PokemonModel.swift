//
//  PokemonModel.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 05/08/23.
//

import Foundation

struct Pokemon {
    let name: String
    let id: Int
    let height, weight: Double
    let imageUrl: String
    let types: [PokemonTypesModel]
    let stats: [PokemonStat]
}

struct PokemonStat: Identifiable {
    let id = UUID().uuidString
    let name: String
    let value: Int
}
