//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Coding on 7/29/21.
//

import XCTest
@testable import FilmFest

class MovieManagerTests: XCTestCase {
    
    var sut: MovieManager!
    
    let scifiMovie = Movie(title: "Sci-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")
    
    lazy var movieArry = [scifiMovie, arthouseMovie, actionMovie]
        
    override func setUpWithError() throws {
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: initial values
    ///sut = SYSTEM UNDER TEST
    func testInit_MoviesToSee_ReturnsZero(){
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero(){
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK: - add & query
    func testAdd_MoviesToSee_ReturnsOne(){
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex(){
        sut.addMovie(movie: arthouseMovie)
        
        let movieQueried = sut.movieAtIndex(index: 0)
        XCTAssertEqual(arthouseMovie.title, movieQueried.title)
        
    }
    
    
    //MARK: - checking off
    
    func testCheckOffMovie_UpdatesMoviesManagerCounts(){
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 1)
    }
    
    func testCheckOffMovie_RemovesMovieFromArray(){
        movieArry.forEach { movie in
            sut.addMovie(movie: movie)
        }
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title, arthouseMovie.title)
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex(){
        sut.addMovie(movie: scifiMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index: 0)
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
    }
    
    //MARK: - clearing and reseting
    
    func testClearArray_ReturnsArrayCountsOfZero(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: actionMovie)
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
        XCTAssertEqual(sut.moviesSeenCount, 1)
        
        sut.clearArrays()
        
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK: - duplicates
    
    func testDuplicateMovies_ShouldNotBeAddedToTheArray(){
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    
}
