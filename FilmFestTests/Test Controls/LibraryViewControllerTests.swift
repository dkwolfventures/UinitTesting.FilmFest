//
//  LibraryViewControllerTests.swift
//  FilmFestTests
//
//  Created by Coding on 7/30/21.
//

import XCTest
@testable import FilmFest

class LibraryViewControllerTests: XCTestCase {
    
    var sut: LibraryViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "LibraryViewControllerID") as? LibraryViewController
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //MARK: - nil checks
    
    func testLibraryVC_TableViewShouldNotBeNil(){
        XCTAssertNotNil(sut.libraryTableView)
    }
    
    //MARK: - datasource
    
    func testDataSource_ViewDidLoad_SetsTableViewDataSource(){
        XCTAssertNotNil(sut.libraryTableView.dataSource)
        XCTAssertTrue(sut.libraryTableView.dataSource is MovieLibraryDataService)
    }
    
    //MARK: - delegate
    
    func testDelegate_ViewDidLoad_SetsTableViewDelegate(){
        XCTAssertNotNil(sut.libraryTableView.delegate)
        XCTAssertTrue(sut.libraryTableView.delegate is MovieLibraryDataService)
    }
    
    //MARK: - data service assumptions
    
    func testDataService_ViewDidLoad_SingleDataServiceObject(){
        XCTAssertEqual(sut.libraryTableView.dataSource as! MovieLibraryDataService, sut.libraryTableView.delegate as! MovieLibraryDataService)
    }

}
