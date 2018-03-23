//
//  ReturnValueTests.swift
//  PokemonTests
//
//  Created by Chris Dean on 2018-03-22.
//  Copyright © 2018 lighthouse-labs. All rights reserved.
//

import XCTest
@testable import Pokemon

class ReturnValueTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_jsonObjectFromData_GivenEmptyData_ShouldThrowAnError() {
        let pokemonRequest = PokemonAPIRequest(networker: MockNetworker())
        let data = Data()
        XCTAssertThrowsError(try pokemonRequest.jsonObject(fromData: data))
    }
    
    func test_jsonObjectFromData_GivenInvalidJsonData_ShouldThrowAnError() {
        let networker = MockNetworker()
        let pokemonRequest = PokemonAPIRequest(networker: networker)
        let invalidJSON = ""
        let data = invalidJSON.data(using: .utf8)!
        XCTAssertThrowsError(try pokemonRequest.jsonObject(fromData: data))
    }
    
    func test_jsonObjectFromData_GivenJSONObjectData_ShouldReturnJSONObject() {
        let networker = MockNetworker()
        let pokemonRequest = PokemonAPIRequest(networker: networker)
        
        let validJSON = "{\"\":\"\"}"
        let data = validJSON.data(using: .utf8)!
        guard let result = try! pokemonRequest.jsonObject(fromData: data) as? [String: String] else {
            XCTFail("Invalid JSON returned")
            return
        }
        XCTAssertEqual(result, ["": ""])
    }
    
    func test_buildUrlFromComponents_GivenEndpoint_ShouldReturnValidURL() {
        let expectedOutput = "https://pokeapi.co/api/v2/pokemon"
        let networker = MockNetworker()
        let pokemonRequest = PokemonAPIRequest(networker: networker)
        let validURL = pokemonRequest.buildURL(endpoint: "pokemon")
        XCTAssertEqual(validURL?.absoluteString, expectedOutput)
        
        //XCTAssertEqual failed: ("Optional("https://pokeapi.co/api/v2/pokemon")") is not equal to ("Optional("https/pokeapi.co/api/v2/pokemon")") -
    }
    
    
    
    
}
















