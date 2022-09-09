//
//  ApiClient+User.swift
//  DimitarIosDemo
//
//  Created by Dimitar Dimitrov on 6.09.22.
//

import Foundation

/*
 1. At this demo project version I decidet to use Singleton and Static functions for parsing data and validating erros
 2. Using throwing custom errors. We are not managing and showing the Custom errors on the screen at this short demo verison!
 3. Decided to test/use async/await in that UIKIT project. Otherwise could use closures or Combine/SwiftRx
 4. Using Encodable and Decodable
 5. Using Generics for Encode/Decode the data
 6. We can extend the APIClient by making extension with a new struct that represents new API module operation
 - commented by: Dimitar
 */
extension ApiClient {
    struct UserOperation {

        public static var inst = UserOperation()

        private init() {}

        public func login(user:User) async -> User? {
            let httpBodyData = ApiDataManager.encodeData(user)
            let req = ApiRouter.UserRouter.login(data: httpBodyData)

            do {
                let apiResponse = try await ApiClient.session.data(for: req.makeFullRequest())
                try ApiErrorManager.validate(result: apiResponse.1)
                let data = try ApiDataManager.decodeData(data: apiResponse.0, type: User.self)
                return data
            }catch(let customErr) {
                _ = customErr as? ApiErrorManager.Errors
                return nil
            }
        }
    }
}
