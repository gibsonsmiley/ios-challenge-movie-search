//
//  MovieController.swift
//  MovieSearch
//
//  Created by Gibson Smiley on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class MovieController {
    static let sharedController = MovieController()
    
    private let url = "https://www.themoviedb.org/3/search/movie?quier="
    private let apiKey = "&api_key=31810dc15f688c0de3ac21e971627ad5"
    
    var movies: [Movie]?
    
    func getMovie(movie: String, completion: (movie: Movie?) -> Void) {
        let url = self.url + "\(movie)" + apiKey
        NetworkController.dataAtURL(url) { (data) in
            guard let data = data else { completion(movie: nil); return }
            NetworkController.jsonFromData(data, completion: { (json) in
                if let json = json {
                    let movie = Movie(json: json)
                    completion(movie: movie)
                } else {
                    completion(movie: nil)
                }
            })
        }
    }
    
    func getMoviePoster(url: String, completion: (image: UIImage?) -> Void) {
        NetworkController.dataAtURL(url) { (data) in
            guard let data = data else { completion(image: nil); return }
            let image = UIImage(data: data)
            dispatch_async(dispatch_get_main_queue(), { 
                completion(image: image)
            })
        }
    }
}