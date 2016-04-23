//
//  TableViewCell.swift
//  MovieSearch
//
//  Created by Gibson Smiley on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    var movie: Movie?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateWithMovie(movie: Movie) {
        self.movie = movie
        nameLabel.text = movie.name
        ratingLabel.text = String(movie.name)
        descriptionLabel.text = movie.description
        
    }

}
