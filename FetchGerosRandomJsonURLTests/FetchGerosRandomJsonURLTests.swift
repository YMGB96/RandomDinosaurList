//
//  FetchGerosRandomJsonURLTests.swift
//  FetchGerosRandomJsonURLTests
//
//  Created by Yannick Brands on 24.11.22.
//

import XCTest
@testable import FetchGerosRandomJsonURL

final class FetchGerosRandomJsonURLTests: XCTestCase {
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
        //some code that pretends that testFetchedDataView did appear in the UI or actually make it appear?
        //some code that delays the next test by 4 seconds because of the manually set delay by Gero (XCTWaiter?)
//        XCTAssertNotEqual(testFetchedDataView.title, "Label goes here", "Should have fetched now, placeholder should be replaced")
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
}
