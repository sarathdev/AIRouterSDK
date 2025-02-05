# AIRouterSDK

AIRouterSDK is a lightweight and powerful iOS SDK that provides seamless integration with AI models through OpenRouter's API. Currently supporting DeepSeek chat model, with architecture in place for future model expansions.

## Features
- **Simple Integration**: Easy-to-use interface for AI model interactions
- **Modern Swift Support**: Built with async/await for better performance
- **Robust Error Handling**: Comprehensive error handling and type-safe responses
- **Configurable**: Supports customizable parameters (temperature, max tokens)
- **Expandable**: Architecture ready for multiple AI model integrations
- **Swift Package Manager Support**: Easy integration with SPM
- **Unit Tests**: Includes tests for reliability and maintainable code

## Requirements
- iOS 13.0+
- Xcode 14.0+
- Swift 5.5+

## Installation

### Swift Package Manager (SPM)
1. In Xcode, go to **File** > **Add Packages**
2. Enter package URL: `https://github.com/yourusername/AIRouterSDK.git`
3. Choose the version you want to use
4. Click **Add Package**

## Getting Started

### 1. Get Your API Key
1. Visit [OpenRouter](https://openrouter.ai/)
2. Sign up for an account
3. Navigate to API Keys section
4. Create a new API key
5. Copy your API key (starts with "sk-or-v1-...")

### 2. Import the SDK
```swift
import AIRouterSDK
```

### 3. Initialize the Client
```swift
let client = AIRouterClient(apiKey: "your-api-key")
```

### 4. Send Prompts
```swift
// Using async/await
do {
    let response = try await client.sendPrompt(
        "Tell me a joke",
        model: .deepseek,
        temperature: 0.7,
        maxTokens: 1000
    )
    print(response.content)
} catch {
    print("Error:", error.localizedDescription)
}
```

## Advanced Usage

### Customizing Parameters
```swift
let response = try await client.sendPrompt(
    "Write a story",
    model: .deepseek,
    temperature: 0.9,  // Higher creativity
    maxTokens: 2000    // Longer response
)
```

### Error Handling
```swift
do {
    let response = try await client.sendPrompt("Your prompt")
    // Handle success
} catch AIError.invalidAPIKey {
    // Handle invalid API key
} catch AIError.rateLimitExceeded {
    // Handle rate limit
} catch {
    // Handle other errors
}
```

## Models
Currently supported models:
- DeepSeek Chat (`AIModel.deepseek`)

Coming soon:
- Mixtral
- GPT-4
- Additional models based on OpenRouter's offerings

## Error Types
- `invalidAPIKey`: Invalid or expired API key
- `networkError`: Network-related issues
- `invalidResponse`: Malformed response from the server
- `rateLimitExceeded`: API rate limit reached
- `modelNotAvailable`: Requested model is unavailable

## OpenRouter API Pricing
- Visit [OpenRouter Pricing](https://openrouter.ai/pricing) for current rates
- Different models have different pricing tiers
- Free tier available for testing

## Best Practices
1. **API Key Security**
   - Never hardcode API keys in your application
   - Use secure storage or environment variables
   - Consider implementing key rotation

2. **Error Handling**
   - Always implement proper error handling
   - Consider implementing retry logic for transient errors
   - Monitor rate limits

3. **Response Handling**
   - Validate responses before using
   - Implement timeout handling
   - Consider caching where appropriate

## Contributing
We welcome contributions to AIRouterSDK! Please follow these steps:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License
AIRouterSDK is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

## Support
- Report issues on [GitHub Issues](https://github.com/yourusername/AIRouterSDK/issues)
- For detailed API documentation, visit [OpenRouter Documentation](https://openrouter.ai/docs)

## Acknowledgments
- [OpenRouter](https://openrouter.ai/) for providing the API infrastructure
- All contributors to this project

## Contact
- Your Name - Sarath Sasi sskumbalath@gmail.com
- Project Link: [https://github.com/sarathdev/AIRouterSDK/tree/main/AIRouterSDK/AIRouterSDK)

---

Made with ❤️ by Sarath Sasi (https://www.linkedin.com/in/sarath-sasi-ios/)
