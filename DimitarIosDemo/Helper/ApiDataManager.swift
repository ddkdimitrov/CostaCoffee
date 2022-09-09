//
//  ApiDataManager.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import Foundation

/**
 1. Generic static methods for decoding/encoding request data. 
 */

struct ApiDataManager {
    
    internal static func decodeData<T: Decodable>(data: Data, type: T.Type) throws -> T {
        do {
            return try JSONDecoder().decode(type.self, from: data)
        } catch {
            throw ApiErrorManager.Errors.jsonDecodeError
        }
    }
    
    internal static func encodeData<T:Encodable>(_ value: T) -> Data {
        var jsonData = Data()
        let jsonEncoder = JSONEncoder()

        do {
            jsonData = try jsonEncoder.encode(value)
        }
        catch {
        }
        return jsonData
    }
}

