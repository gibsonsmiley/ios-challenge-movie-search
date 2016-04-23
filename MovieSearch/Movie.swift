//
//  Movie.swift
//  MovieSearch
//
//  Created by Gibson Smiley on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Movie {
    
    private let kName = "title"
    private let kRating = "vote_average"
    private let kDescription = "overview"
    private let kImageEndpoint = "poster_path"
    
    var name: String
    var rating: Float
    var description: String
    var imageEndpoint: String
    
    init?(json: [String: AnyObject]) {
        guard let name = json[kName] as? String,
            rating = json[kRating] as? Float,
            description = json[kDescription] as? String,
            imageEndpoint = json[kImageEndpoint] as? String else { return nil }
        self.name = name
        self.rating = rating
        self.description = description
        self.imageEndpoint = imageEndpoint
    }
}