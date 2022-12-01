//
//  FetchedDataViewTests.swift
//  FetchGerosRandomJsonURLTests
//
//  Created by Yannick Brands on 01.12.22.
//

import XCTest
@testable import FetchGerosRandomJsonURL

final class FetchedDataViewTests: XCTestCase {
    var testFetchedDataView: FetchedDataView!

    override func setUpWithError() throws {
        testFetchedDataView = FetchedDataView(id: 0)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        testFetchedDataView = nil
    }

    func testFetchedDataViewFetchesOnAppear() {
        XCTAssertEqual(testFetchedDataView.title, "Label goes here", "Should only fetch when it appears in the UI")
        //some code that pretends that testFetchedDataView did appear in the UI
        //some code that delays the next test by 3 seconds because of the manually set delay by Gero
        //XCTAssertNotEqual(testFetchedDataView.title, "Label goes here", "Should have fetched now, placeholder should be replaced")
    }
    
    func testURLIsReachable() {
        //XCTAssertEqual(-http status code is 200 when trying to fetch the data-)
    }
    
    func testAddButtonAddsOneElement() {
        //click on Add, 1 FetchedDataView is loaded
    }
    
    func testDeleteOfItemInList() {
        //somehow test that an item in the list is truly deleted when it should be
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
