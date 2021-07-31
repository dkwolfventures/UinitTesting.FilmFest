//
//  MovieStructTests.swift
//  FilmFestTests
//
//  Created by Coding on 7/28/21.
//

import XCTest
@testable import FilmFest

class MovieStructTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: - init

    func testInit_MovieWithTitle(){
        
        let testMovie = Movie(title: "Generic Blockbuster")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_SetMovieTitleAndReleaseDate(){
        let testMovie = Movie(title: "Generic Blockbuster", releaseDate: "September 11th, 1974")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "September 11th, 1974")
    }
    
    //MARK: - Equatable
    
    func testEquatable_ReturnsTrue(){
        let movie1 = Movie(title: "Action")
        let movie2 = Movie(title: "Action")
        
        XCTAssertEqual(movie1, movie2)
    }
    
}
