//
//  Extension+String.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import Foundation
import CryptoKit

/*
 1. Usefull string extension methods which we use often
 2. sha256 we dont need for a Crypto/Decrypto Manager in that short demo version and we use only one short single method for encryptiong the login password. Thats why method extension is valuble for that goal. Otherwise if we have multiple complex and often use methods, I would create class/struct Manager.
 3. Extension methods like managing data isEmpty() / toDouble() and others similar its a good practice for easy coding widhout code duplications and less code.
 - commented by: Dimitar
 */
extension String {
    
    public func sha256() -> String {
        let inputData = Data(self.utf8)
        let hashed = SHA256.hash(data: inputData).description
        let result = hashed.description.replacingOccurrences(of: "SHA256 digest: ", with: "")
        print(result)
        return result
    }
    
    public func isEmpty() -> Bool {
        if self.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return true
        }
        return false
    }
    
    public func toDouble() -> Double {
        return Double(self) ?? 0.0
    }
}
