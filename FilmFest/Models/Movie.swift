//
//  Movie.swift
//  FilmFest
//
//  Created by Coding on 7/28/21.
//

import Foundation

struct Movie: Equatable {
    let title: String
    let releaseDate: String?
    
    init(title: String, releaseDate: String? = nil){
        self.title = title
        self.releaseDate = releaseDate
    }
}
