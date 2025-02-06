//
//  AIRouterClient.swift
//  AIRouterSDK
//
//  Created by Sarath Sasi on 05/02/25.
//

import Foundation

public class AIRouterClient {
    // MARK: - Properties
    private let apiKey: String
    private let networkManager: NetworkManager
    private let baseURL = URL(string: "https://openrouter.ai/api/v1/chat/completions")!
    
    // MARK: - Initialization
    public init(apiKey: String, networkManager: NetworkManager = .default) {
        self.apiKey = apiKey
        self.networkManager = networkManager
    }
    
    // MARK: - Public Methods
    public func sendPrompt(_ prompt: String,
                          model: AIModel = .deepseek,
                          temperature: Double = 0.7,
                          maxTokens: Int = 1000) async throws -> AIResponse {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("AIRouterSDK/1.0.0", forHTTPHeaderField: "HTTP-Referer")
        
        // Add model-specific headers
        model.provider.modelSpecificHeaders.forEach { key, value in
            request.addValue(value, forHTTPHeaderField: key)
        }
        
        let body: [String: Any] = [
            "model": model.rawValue,
            "messages": [
                ["role": "user", "content": prompt]
            ],
            "temperature": temperature,
            "max_tokens": maxTokens
        ]
        
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw AIError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200:
            return try model.provider.processResponse(data)
        case 401:
            throw AIError.invalidAPIKey
        case 429:
            throw AIError.rateLimitExceeded
        default:
            throw AIError.networkError(NSError(domain: "HTTPError", code: httpResponse.statusCode))
        }
    }
}
