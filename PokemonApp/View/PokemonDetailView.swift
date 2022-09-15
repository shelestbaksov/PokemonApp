//
//  PokemonDetailView.swift
//  PokemonApp
//
//  Created by Leysan Latypova on 15.09.2022.
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    @ObservedObject var viewModel = PokemonViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding <PresentationMode>
    var pokemon: Pokemon
    
    var body: some View {
        ZStack {
            Color(viewModel.backgroundColor(forType: pokemon.type))
            ScrollView {
                Spacer()
                    .frame(height: 40)
                KFImage(URL(string: pokemon.imageUrl))
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 400)
                    .padding(.leading, 20)
                    .padding(.trailing, 20)
                    .padding(.top, 20)
                VStack(alignment: .leading) {
                    Text(pokemon.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Description")
                        .fontWeight(.medium)
                        .padding(.vertical)
                    Text(pokemon.description)
                        .lineSpacing(8.0)
                        .opacity(0.6)
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("Size")
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                            Text("Height: \(pokemon.height) cm")
                                .opacity(0.6)
                            Text("Width: \(pokemon.weight) kg")
                                .opacity(0.6)
                            Text("Type: \(pokemon.type)")
                                .opacity(0.6)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding()
                .padding(.top)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
                .offset(x: 0, y: 0)
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
//struct PokemonDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        PokemonDetailView(, pokemon: Pokemon)
//    }
//}
