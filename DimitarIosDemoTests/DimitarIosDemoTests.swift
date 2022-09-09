//
//  DimitarIosDemoTests.swift
//  DimitarIosDemoTests
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import XCTest
@testable import DimitarIosDemo

class DimitarIosDemoTests: XCTestCase {
    
    var loginViewModel:LoginViewModel!
    
    override func setUp() {
        super.setUp()
        
       //Init
        loginViewModel = LoginViewModel()
    }
    
    override func tearDown() {
        super.tearDown()
        
        //Set nil
        loginViewModel = nil
    }
    
    
    func test_make_sha256_string() {
        let hashString = "ddk.dimitrov@gmail.com" + "abv123" + "PizzaLab!OU1"
        let data = hashString.sha256()
        XCTAssertTrue(data == "140b1f280e13f9e199a4b00ae993a013595c13dd914eb0993071b2d4a1ca045f")
    }
    
    func test_user_validation(){
        var user = User()
        user.email = ""
        user.password = ""
    }
}
