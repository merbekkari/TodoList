//
//  MisterAutoTests.swift
//  MisterAutoTests
//
//  Created by mbekkari on 1/5/2022.
//

import XCTest
@testable import MisterAuto

class MisterAutoTests: XCTestCase {
    
    func getListUsersServicesTest() throws {
        UsersServices().getListUsers { users, success, error in
            if success == false {
                XCTFail("Failed")
        }
            XCTAssertNil(users?.first)
        }
    }
    
    func getListTachesUsersServicesTest() throws {
        let idUser = 1
        ListTacheUsersServices().getListTAcheByUser(id: idUser) { result, success, error in
            if success == false {
                XCTFail("Failed")
        }
            XCTAssertNil(result)
        }
    }
    


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
