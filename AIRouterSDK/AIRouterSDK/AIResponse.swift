//
//  AIResponse.swift
//  AIRouterSDK
//
//  Created by Sarath Sasi on 05/02/25.
//

import Foundation

public struct AIResponse: Codable {
    public let content: String
    public let model: String
    public let usage: TokenUsage
    
    public struct TokenUsage: Codable {
        public let promptTokens: Int
        public let completionTokens: Int
        public let totalTokens: Int
        
        enum CodingKeys: String, CodingKey {
            case promptTokens = "prompt_tokens"
            case completionTokens = "completion_tokens"
            case totalTokens = "total_tokens"
        }
    }
}
