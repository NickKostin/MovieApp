//
//  MovieBackdropCard.swift
//
//  Created by Никита Костин on 13.08.2020.
//  Copyright © 2020 Никита Костин. All rights reserved.
//

import SwiftUI

struct MovieBackdropCard: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                    .resizable()
                }
            }
            .aspectRatio(16/9, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            
            VStack(alignment: .leading){
            
            Text(movie.title)
                HStack{
                    Text(movie.yearText)
                }
                HStack(alignment: .top){
                    Text(movie.ratingText)
                    .foregroundColor(.yellow)
                    Text(movie.scoreText)
                }
            }
        }
        .lineLimit(1)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }
    }
}

struct MovieBackdropCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCard(movie: Movie.stubbedMovie)
    }
}
