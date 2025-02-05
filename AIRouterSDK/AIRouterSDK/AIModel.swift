//
//  AIModel.swift
//  AIRouterSDK
//
//  Created by Sarath Sasi on 05/02/25.
//

import Foundation

public enum AIModel: String {
    case deepseek = "deepseek/deepseek-chat"
    case mixtral = "mistralai/mixtral-8x7b-instruct"
    case gpt4 = "openai/gpt-4"
    
    var provider: AIProvider {
        switch self {
        case .deepseek: return DeepSeekProvider()
        case .mixtral: return MixtralProvider()
        case .gpt4: return GPT4Provider()
        }
    }
}
