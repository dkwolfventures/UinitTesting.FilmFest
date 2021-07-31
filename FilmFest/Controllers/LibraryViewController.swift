//
//  ViewController.swift
//  FilmFest
//
//  Created by Coding on 7/28/21.
//

import UIKit

class LibraryViewController: UIViewController {
    
    //MARK: - properties
    
    @IBOutlet weak var libraryTableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    var movieManager = MovieManager()
    
    //MARK: - actions
    
    //MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.libraryTableView.dataSource = dataService
        self.libraryTableView.delegate = dataService
        
        dataService.movieManager = movieManager
        
        dataService.movieManager?.addMovie(movie: Movie(title: "Action", releaseDate: "1999"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Horror", releaseDate: "1998"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Crime Thriller", releaseDate: "1989"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Indie Comedy", releaseDate: "2000"))
        dataService.movieManager?.addMovie(movie: Movie(title: "Fu Flick", releaseDate: "2021"))

        libraryTableView.reloadData()
    }
    
    //MARK: - helpers


}

