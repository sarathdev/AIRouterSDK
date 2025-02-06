//
//  AIProvider.swift
//  AIRouterSDK
//
//  Created by Sarath Sasi on 05/02/25.
//

import Foundation

public protocol AIProvider {
   func processResponse(_ response: Data) throws -> AIResponse
   func validateRequest(_ prompt: String) throws
   var modelSpecificHeaders: [String: String] { get }
}

// Default implementation
public extension AIProvider {
   public func validateRequest(_ prompt: String) throws {  // Make method public
       guard !prompt.isEmpty else {
           throw AIError.invalidResponse
       }
   }
   
   public var modelSpecificHeaders: [String: String] { [:] }  // Make property public
}
