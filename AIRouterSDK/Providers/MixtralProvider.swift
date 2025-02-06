//
//  MixtralProvider.swift
//  AIRouterSDK
//
//  Created by Sarath Sasi on 05/02/25.
//

import Foundation

public class MixtralProvider: AIProvider {
    public func processResponse(_ response: Data) throws -> AIResponse {
        // For now, use same implementation as DeepSeek
        return try DeepSeekProvider().processResponse(response)
    }
    
    public func validateRequest(_ prompt: String) throws {
        // Use default implementation
    }
    
    public var modelSpecificHeaders: [String: String] { [:] }
}
