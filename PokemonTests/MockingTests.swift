//
//  MockingTests.swift
//  PokemonTests
//
//  Created by Chris Dean on 2018-03-22.
//  Copyright © 2018 lighthouse-labs. All rights reserved.
//

import XCTest
@testable import Pokemon


class MockNetworker: NetworkerType {
    

    
    func requestData(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        let file = Bundle.main.path(forResource: "pokemon", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: file!))
        completionHandler(data, nil, nil)
    
    }
    
}


class MockingTests: XCTestCase {
    
    var mockNetworker: MockNetworker?
    var pokemonApiRequest: PokemonAPIRequest?
    
    override func setUp() {
        super.setUp()
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_getAllPokemons_ShouldBeSuccessfull() {
        
        mockNetworker = MockNetworker()
        pokemonApiRequest = PokemonAPIRequest(networker: mockNetworker!)
        var array = [Pokemon]()
        
        pokemonApiRequest?.getAllPokemons { (result, nil) in
            array = result!
        }
        let firstPokemon = array[0]
        XCTAssertEqual(firstPokemon.name, "bulbasaur")
    }

    
    
}
