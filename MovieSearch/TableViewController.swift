//
//  TableViewController.swift
//  MovieSearch
//
//  Created by Gibson Smiley on 4/22/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController , UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if MovieController.sharedController.movies != nil {
            return MovieController.sharedController.movies!.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("movieCell", forIndexPath: indexPath) as? TableViewCell {
            let movie = MovieController.sharedController.movies![indexPath.row]
            cell.updateWithMovie(movie)
            return cell
        } else {
            return UITableViewCell()
        }
    }
        
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let search = searchBar.text {
            MovieController.sharedController.getMovie(search) { (movie) in
                guard let movies = movie else { return }
                MovieController.sharedController.movies?.append(movies)
                searchBar.resignFirstResponder()
                self.tableView.reloadData()
            }
        } else {
            return
        }
    }
}
