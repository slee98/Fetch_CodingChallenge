//
//  DataManager.swift
//  Fetch_CodingChallenge
//
//  Created by Soyeon Lee on 7/17/24.
//

import Foundation

class DataManager {
    
    private let baseURL = "https://www.themealdb.com/api/json/v1/1"
    
    func performRequest<T: Decodable>(endpoint: String) async throws -> T {
        let urlString = "\(baseURL)\(endpoint)"
        guard let url = URL(string: urlString) else {
            throw DataManagerError.invalidURL
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Check for valid HTTP response
            guard let httpResponse = response as? HTTPURLResponse else {
                throw DataManagerError.invalidResponse
            }
            
            guard httpResponse.statusCode < 300 else {
                throw DataManagerError.badServerResponse(statusCode: httpResponse.statusCode)
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                return decodedResponse
            } catch {
                throw DataManagerError.decodingError(error)
            }
        }
        catch {
            throw DataManagerError.networkError(error)
        }
    }
}

enum DataManagerError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case badServerResponse(statusCode: Int)
    case decodingError(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid."
        case .networkError(let error):
            return "A network error occurred: \(error.localizedDescription)"
        case .invalidResponse:
            return "The response from the server was invalid."
        case .badServerResponse(let statusCode):
            return "Bad server response with status code: \(statusCode)"
        case .decodingError(let error):
            return "Failed to decode the response: \(error.localizedDescription)"
        }
    }
}
