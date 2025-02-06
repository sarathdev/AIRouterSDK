//
//  AIRouterSDKTests.swift
//  AIRouterSDKTests
//
//  Created by Sarath Sasi on 05/02/25.
//

import Testing

import XCTest
@testable import AIRouterSDK

final class AIRouterTests: XCTestCase {
    var client: AIRouterClient!
    
    override func setUp() {
        super.setUp()
        client = AIRouterClient(apiKey: "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")
    }
    
    func testSendPrompt() async throws {
        let expectation = expectation(description: "API Call")
        
        do {
            let response = try await client.sendPrompt("Hello, world!")
            XCTAssertFalse(response.content.isEmpty)
            expectation.fulfill()
        } catch {
            XCTFail("API call failed: \(error.localizedDescription)")
        }
        
        await waitForExpectations(timeout: 150)
    }
}
