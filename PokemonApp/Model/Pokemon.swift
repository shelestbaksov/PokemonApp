//
//  Pokemon.swift
//  PokemonApp
//
//  Created by Leysan Latypova on 15.09.2022.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let imageUrl: String
    let description: String
    let height: Int
    let weight: Int
}

