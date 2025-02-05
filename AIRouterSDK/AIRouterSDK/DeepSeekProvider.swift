//
//  DeepSeekProvider.swift
//  AIRouterSDK
//
//  Created by Sarath Sasi on 05/02/25.
//

import Foundation

public class DeepSeekProvider: AIProvider {
    public func processResponse(_ response: Data) throws -> AIResponse {
        do {
            let jsonResponse = try JSONDecoder().decode(OpenRouterResponse.self, from: response)
            guard let firstChoice = jsonResponse.choices.first,
                  let message = firstChoice.message else {
                throw AIError.invalidResponse
            }
            
            return AIResponse(
                content: message.content,
                model: jsonResponse.model,
                usage: jsonResponse.usage
            )
        } catch {
            throw AIError.invalidResponse
        }
    }
}

private struct OpenRouterResponse: Codable {
    let model: String
    let choices: [Choice]
    let usage: AIResponse.TokenUsage
    
    struct Choice: Codable {
        let message: Message?
    }
    
    struct Message: Codable {
        let content: String
    }
}
