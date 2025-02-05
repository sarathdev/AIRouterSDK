//
//  AIError.swift
//  AIRouterSDK
//
//  Created by Sarath Sasi on 05/02/25.
//

import Foundation

public enum AIError: Error {
    case invalidAPIKey
    case networkError(Error)
    case invalidResponse
    case rateLimitExceeded
    case modelNotAvailable
    
    public var localizedDescription: String {
        switch self {
        case .invalidAPIKey:
            return "Invalid API key. Please check your credentials."
        case .networkError(let error):
            return "Network error occurred: \(error.localizedDescription)"
        case .invalidResponse:
            return "Received invalid response from server."
        case .rateLimitExceeded:
            return "Rate limit exceeded. Please try again later."
        case .modelNotAvailable:
            return "The requested AI model is not available."
        }
    }
}
